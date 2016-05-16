# Controls the job seeker profile [private and public]
class JobSeekersController < ApplicationController
     
     # Flag to check if edit features are to be enabled
     @showEditFeatures = false


###############################################
# Display

	# Shows the profile of the job seeker
	# based on the ID passed as the parameter
	# it enables edit features if the job seeker
	# is viewing his/her own profile
	def show
		if params.has_key?(:id) 
			if params.has_key?(:job_id)
				@job = Job.find(params[:job_id])
			end
			if is_valid_id params[:id].to_i

				@jobseeker = JobSeeker.find(params[:id])
				@user = User.find(@jobseeker.user_id)
				@portfolio = PortfolioItem.where(job_seeker_id: @jobseeker.id)

				# Enable editing
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

			# in case of ID being absent render profile for logged in user
			# with enabled editing.
			@showEditFeatures = true


		else
			redirect_to login_path
		end

	end
######################################################





######################################################
# Creating and saving portfolio items

	# Renders form for creating new portfolio item 
	# for the job seeker
	def new_portfolio_item
		respond_to do |format|
			format.js
		end
	end

	# Save portfolio item created and redirect back to profile page
	def save_portfolio_item
		seeker_id = JobSeeker.find_by(user_id: current_user.id).id
		PortfolioItem.create(:job_seeker_id => seeker_id, :url => params[:URL], :project_type => params[:itemType], :description => params[:description], :name => params[:title] )
		redirect_to '/profile/'
	end
##########################################################





##########################################################
# Additional functions

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

	# Renders messages recieved.
	def messages
		@messages = InterviewMessage.where(job_seeker_id: current_user.job_seeker.id)
	end

###########################################################
end