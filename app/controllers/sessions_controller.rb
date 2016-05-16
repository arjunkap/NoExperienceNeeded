class SessionsController < ApplicationController
  
    # Redirect the current user to appropriate profile
    def new
        if logged_in?
          if current_user.company
            redirect_to controller: "employers", action: "show", id: current_user.company.id
          elsif current_user.job_seeker
            redirect_to controller: "job_seekers", action: "show", id: current_user.job_seeker.id
          end
        end
    end


    # Create a session and aunthenticating login
    def create

      	user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          remember user
         
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          if session[:current_job_application]
            job_id = session[:current_job_application]
            redirect_to controller: 'jobs', action: 'show', id: job_id
          else
            if is_current_user_job_seeker?
              redirect_to controller: 'job_seekers', action: 'show', id: current_user.job_seeker.id
            elsif is_current_user_employer?
              redirect_to controller: 'employers', action: 'show', id: current_user.company.id
            end
          end 
          
        else

          flash.now[:danger] = 'Invalid email/password combination'
          @messages_rendered = false
          render 'new'
        end
    end

    # On logout, destroy session
    def destroy
    	log_out if logged_in?
      redirect_to root_url
    end

end
