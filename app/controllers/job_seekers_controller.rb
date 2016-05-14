class JobSeekersController < ApplicationController
     @showEditFeatures = false





###############################################
	def show
		if params.has_key?(:id) 
			if params.has_key?(:job_id)
				@job = Job.find(params[:job_id])
			end
			if is_valid_id params[:id].to_i

				@jobseeker = JobSeeker.find(params[:id])
				@user = User.find(@jobseeker.user_id)
				@portfolio = PortfolioItem.where(job_seeker_id: @jobseeker.id)

				if is_same_as_logged_in_job_seeker @user
					@showEditFeatures = true
				end
			else
				redirect_to login_path
			end

		elsif current_user
			@user = current_user
			@jobseeker = JobSeeker.find_by(user_id: @user.id)
			@portfolio = PortfolioItem.where(job_seeker_id: @jobseeker.id)
			@showEditFeatures = true


		else
			redirect_to login_path
		end

	end
######################################################





######################################################
	def new_portfolio_item
		respond_to do |format|
			format.js
		end
	end

	def save_portfolio_item
		seeker_id = JobSeeker.find_by(user_id: current_user.id).id
		PortfolioItem.create(:job_seeker_id => seeker_id, :url => params[:URL], :project_type => params[:itemType], :description => params[:description], :name => params[:title] )
		redirect_to '/profile/'
	end
##########################################################





##########################################################
	def is_same_as_logged_in_job_seeker user
		return user == current_user
	end



	def is_valid_id id
		JobSeeker.all.each do |seeker|
			if seeker.id == id
				return true
			end
		end
		return false
	end

	def messages
		@messages = InterviewMessage.where(job_seeker_id: current_user.job_seeker.id)
	end

###########################################################
end