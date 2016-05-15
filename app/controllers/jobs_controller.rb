class JobsController < ApplicationController
	
	require 'date'
	before_action :find_job, only: [:show, :edit, :update, :destroy, :apply, :applications]

	def index
		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def create
			@job = current_user.jobs.new(job_params)
				if @job.save
					 flash[:success] = "Job created!"
					 redirect_to controller: 'employers', action: 'show', id: current_user.company.id
				else
					render 'new'
				end
	
		
	end

	def destroy
		@job.destroy
		redirect_to controller: 'employers', action: 'show', id: current_user.company.id
	end

	def show

	end

	
	def edit

	end

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

	def create_new_job
		@job = Job.new
		respond_to do |format|
			format.js
		end
	end

	def new
		if is_current_user_employer?
			@job = Job.new
		else

		end

	end

	def short_list
		job = Job.find(params[:job])
		@button_id = "#btn#{job.id}"
		job_seeker = current_user.job_seeker
		job_seeker.short_listed_jobs.create(job_id: job.id)
		flash[:success] = "Added"
		puts "%%%%%%%%%%%%%%%%%%555"
		puts @button_id
		respond_to do |format|
			
			format.js
		end

	end
		



	def update
    if @job.update_attributes(job_params)
      redirect_to controller: 'employers', action: 'show', id: current_user.company.id
    else
      render 'edit'
    end

	end

	def applications
		@applications = JobApplication.where(job_id: @job.id)

	end

	def create_application
		job_id = params[:job_id]
		question1 = params[:question1]
		question2 = params[:question2]
		question3 = params[:question3]
		job_seeker = current_user.job_seeker

		jp = JobApplication.new(question1: question1,question2: question2,question3: question3, job_id: job_id, job_seeker_id: job_seeker.id)
		puts "------------cool"
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

	def apply
		# if !logged_in?
		# 	session[:was_applying_for] = @job.id
		# 	render  template: 'sessions/new'
		# else
		# 	redirect_to controller: 'jobs', action: 'show', id: @job.id
		# end

		respond_to do |format|
			format.js

		end

		
	end


	def short_listed_jobs

		@sjobs = current_user.job_seeker.short_listed_jobs

	end


	private
		def job_params
			params.require(:job).permit(:title, :description, :city, :country, :question1, :question2, :question3, :category, :closing_date, :work_type)
		end

		def find_job
			if Job.exists?(params[:id])
				@job = Job.find(params[:id])
			else
				render :file => "#{Rails.root}/public/404.html",  :status => 404
			end
		end
end
