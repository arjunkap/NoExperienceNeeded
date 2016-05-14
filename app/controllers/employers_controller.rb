class EmployersController < ApplicationController
	
	def index 

	end

	def show
		@active_jobs = current_user.jobs
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
end
