class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
     
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if session[:current_job_application]
        job_id = session[:current_job_application]
        #redirect_to controller: 'jobs', action: 'apply', id: job_id.to_i
        redirect_to controller: 'jobs', action: 'show', id: job_id
      else
        redirect_to user
      end 
      
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end

end
