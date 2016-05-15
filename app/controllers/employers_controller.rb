class EmployersController < ApplicationController
	
	def index 

	end

	def show
		#@active_jobs = current_user.jobsif params.has_key?(:id) 
		if params.has_key?(:id) 
			if is_valid_id params[:id].to_i
				@Company = Company.find(params[:id])
				@user = User.find(@Company.user_id)
				if is_same_as_logged_in_user @user
					@active_jobs = current_user.jobs

				else
					redirect_to login_path
				end

			else
				redirect_to login_path
			end

		elsif current_user
			@active_jobs = current_user.jobs	
		else
			redirect_to login_path
		end
	end

	def destroy

	end

	def create

	end

	def update

	end

	def message_prompt
		@job = Job.find(params[:job_id])
		@seeker = JobSeeker.find(params[:seeker_id])
	end

	def send_message

		InterviewMessage.create(job_id: params[:interview][:job_id], job_seeker_id: params[:interview][:seeker_id], message: params[:interview][:message])
		job_id = params[:job_id]
		seeker_id = params[:seeker_id]
		redirect_to controller: 'employers', action: 'show', id: current_user.company.id 
	end

	def is_same_as_logged_in_user user
		return user == current_user
	end



	def is_valid_id id
		Company.all.each do |seeker|
			if seeker.id == id
				return true
			end
		end
		return false
	end
end
