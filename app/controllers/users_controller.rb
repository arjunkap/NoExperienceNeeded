# Controls generic user functions common to both job_seeker and employer
class UsersController < ApplicationController
	
	# Display the type of the job seeker
	def show
		@user = User.find(params[:id])
	end

	def index

	end

	def new
	end

	def create
		@user = User.new(user_params)
		 if @user.save
		  	flash.now[:success] = "Welcome to the NEN!"
	 	  	if @company
		    	abn = params[:abn]
		    	company = params[:company]
		    	@user.company = Company.new(abn: abn, title: params[:company])
		    	@user.save
		    	log_in @user
		    	redirect_to controller: 'employers', action: 'show'
	     	else
		     	mobile = params[:mobile]
		    	@user.job_seeker = JobSeeker.new(mobile: mobile)
		    	@user.save
		    	log_in @user
		    	redirect_to controller: 'job_seekers', action: 'show'
	     	end
	    else
	      render 'new'
	    end
  
	end

	def job_seeker
		session[:action] = "create_job_seeker"
		@user = User.new
		render "new"
	end


	def create_job_seeker
		 @user = User.new(user_params)
		 if @user.save
	 		@user.build_job_seeker
    		@user.job_seeker.save
		      log_in @user
		      flash.now[:success] = "Welcome to the NEN!"
		      redirect_to controller: "job_seekers", action: "show", id: @user.job_seeker.id
    else
      render 'new'
    end

	end

	def create_employer
	 @user = User.new(user_params)
	 if @user.save
	 	  @user.build_company(abn: params[:abn], title: params[:company_name])
	 	  @user.company.save
		  log_in @user
		  flash.now[:success] = "Welcome to the NEN!"
		  redirect_to controller: "employers",action: "show", id: @user.company.id
		
	 else
	      render 'new'
	 end

	end

	def employer
		session[:action] = "create_employer"
		@user  = User.new
		render "new"
	end

	private

	def user_params
      params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :state, :city)
    end

    def company_params
    	params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :country, :state, :city, :abn)
    end
end