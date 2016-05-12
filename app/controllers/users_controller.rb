class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end

	def index

	end

	def new
		# @company = params[:company].to_i == 1 ? true : false
		# puts @company
		# @user = User.new
	end

	def create
		@user = User.new(user_params)
		 if @user.save
		  flash[:success] = "Welcome to the NEN!"
	 	  if @company
	    	abn = params[:abn]
	    	@user.company = Company.new(abn: abn)
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
		@company = false
		@action = "create_job_seeker"
		@user = User.new
		render "new"
	end


	def create_job_seeker
		 @company = false
		 @user = User.new(user_params)
		 if @user.save
		 		@user.job_seeker = JobSeeker.new
    		@user.job_seeker.save
	      log_in @user
	      flash[:success] = "Welcome to the NEN!"
	      redirect_to @user
    else
      render 'new'
    end

	end

	def create_employer
		 @company = true
		 @user = User.new(user_params)

		 if @user.save
		 		abn = params[:abn]
	    	@user.company = Company.new(abn: abn)
	    	@user.company.save
	      log_in @user
	      flash[:success] = "Welcome to the NEN!"
	      redirect_to @user
    else
      render 'new'
    end
	end

	def employer
		@action = "create_employer"
		@company = true
		@user  = User.new
		render "new"
	end

	private

	def user_params
      params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :country, :state, :city)
    end

    def company_params
    	params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :country, :state, :city, :abn)
    end
end