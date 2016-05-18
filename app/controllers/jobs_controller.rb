# Controls all jobs posted on the website
class JobsController < ApplicationController
	
	require 'date'
	before_action :find_job, only: [:show, :edit, :update, :destroy, :apply, :applications]

	# Displays job results based on category
	def index
		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		end
	end

	# creates a new job record
	def create
		@job = current_user.jobs.new(job_params)
			if @job.save
				 flash[:success] = "Job created!"
				 redirect_to controller: 'employers', action: 'show', id: current_user.company.id
			else
				render 'new'
			end

		
	end

	# Destroys any jobs record
	def destroy
		ShortListedJob.where(job_id: @job.id).delete_all
		JobApplication.where(job_id: @job.id).delete_all
		InterviewMessage.where(job_id: @job.id).delete_all
		@job.destroy
		redirect_to controller: 'employers', action: 'show', id: current_user.company.id
	end

	def show

	end

	
	def edit

	end

	# Displays all active jobs for a given company
	# Displayed inside company dashboard
	def active_jobs
		@jobs = []
		if current_user
			if current_user.company
				@jobs = current_user.jobs
				puts "-------------------" + @jobs.count
			end
		end
		respond_to do |format|
			format.js
		end
	end

	# Create a new job using AJAX inside a given 
	# company dashboard
	def create_new_job
		@job = Job.new
		respond_to do |format|
			format.js
		end
	end

	# Creates a new job and saves it for a company
	def new
		if is_current_user_employer?
			@job = Job.new
		else

		end

	end

	# Allows for user to shortlist a job for
	# future reference
	def short_list
		job = Job.find(params[:job])
		@button_id = "#btn#{job.id}"
		job_seeker = current_user.job_seeker
		job_seeker.short_listed_jobs.create(job_id: job.id)
		flash.now[:success] = "Added"
		puts @button_id
		respond_to do |format|
			
			format.js
		end

	end
		


	# Allows employers to update jobs they have created
	# redirects to employer dashboard
	def update
	    if @job.update_attributes(job_params)
	      redirect_to controller: 'employers', action: 'show', id: current_user.company.id
	    else
	      render 'edit'
	    end
	end

	# Allows employers to see the applications recieved from
	# Job seekers for any given job
	def applications
		@applications = JobApplication.where(job_id: @job.id)
	end

	# Allows for job seekers to apply for jobs created by an employer
	def create_application
		job_id = params[:job_id]
		question1 = params[:question1]
		question2 = params[:question2]
		question3 = params[:question3]
		job_seeker = current_user.job_seeker

		jp = JobApplication.new(question1: question1,question2: question2,question3: question3, job_id: job_id, job_seeker_id: job_seeker.id)
		if jp.save
			
			if  job_seeker.short_listed_jobs.exists?(job_id)
				job_seeker.short_listed_jobs.delete(job_id)
			end
			flash[:success] = "You successfully applied for this job."
			respond_to do |format|
				format.js
			end
		

		else
			flash[:failure] = "Sorry, something wrong happened."
		end
	end

	# Allows user to apply for jobs
	def apply
		respond_to do |format|
			format.js
		end
	end

	# renders a list of short listed job for a given job seeker
	# if they are logged in
	def short_listed_jobs
		if current_user and current_user.job_seeker
			all_short_listed_jobs = current_user.job_seeker.short_listed_jobs
			@sjobs = []

			# check for empty query
			if params[:query] != "" and params[:query] != nil
				query = params[:query].downcase
				all_short_listed_jobs.each do |sjob|
					job = Job.find(sjob.job_id)
					if job.title.downcase.include? query
						@sjobs.push sjob
					end
				end
			else
				@sjobs = all_short_listed_jobs 
			end
		else
			render :file => "#{Rails.root}/public/404.html",  :status => 404
		end
		

	end


	private
		def job_params
			params.require(:job).permit(:title, :description, :city, :state, :question1, :question2, :question3, :category, :closing_date, :work_type)
		end

		def find_job
			if Job.exists?(params[:id])
				@job = Job.find(params[:id])
			else
				render :file => "#{Rails.root}/public/404.html",  :status => 404
			end
		end
end
