# Controls the company dashboard
class EmployersController < ApplicationController
	
	def index 
	end

	# Shows the dahsboard for the company which has logged in 
	def show

		# If parameters contains a valid ID
		if params.has_key?(:id) 

			# Check if ID is valid
			if is_valid_id params[:id].to_i

				# Find the users associated with the ID
				@Company = Company.find(params[:id])
				@user = User.find(@Company.user_id)

				# Match if the user is identified is same
				# as user logged in
				if is_same_as_logged_in_user @user
					@active_jobs = current_user.jobs

				else
					redirect_to login_path
				end

			# if not redirect to login
			else
				redirect_to login_path
			end

		# Display dashboard for logged in company
		elsif current_user
			@active_jobs = current_user.jobs	
		else
			redirect_to login_path
		end
	end

	# Renders message prompt
	def message_prompt
		@job = Job.find(params[:job_id])
		@seeker = JobSeeker.find(params[:seeker_id])
	end

	# Send message to job seeker
	def send_message

		InterviewMessage.create(job_id: params[:interview][:job_id], job_seeker_id: params[:interview][:seeker_id], message: params[:interview][:message])
		job_id = params[:job_id]
		seeker_id = params[:seeker_id]
		redirect_to controller: 'employers', action: 'show', id: current_user.company.id 
	end


	# Check if passed user is same as user who has logged in
	def is_same_as_logged_in_user user
		return user == current_user
	end


	# Check if a company corresponding to the given Id exists.
	def is_valid_id id
		return Company.exists?(id)
	end
end
