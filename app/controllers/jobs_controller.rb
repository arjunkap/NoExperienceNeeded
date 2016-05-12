class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy, :apply]

	def index
		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def create
		@job = Job.new(job_params)

		if @job.save
			redirect_to @job
		else
			render "new"
		end
	end

	def destroy
		@job.destroy
		redirect_to jobs_path
	end

	def show

	end

	def edit

	end

	def active_jobs
		if current_user
			if current_user.company
				@jobs = current_user.jobs

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
		@job = Job.new
		respond_to do |format|
			format.js
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
      redirect_to jobs_path
    else
      render 'edit'
    end

	end

	def create_application
		job = params[:job]
		motivation = params[:motivation]
		jp = JobApplication.new(motivation_text: motivation, job_id: job.to_i, job_seeker_id: current_user.job_seeker.id)
		if jp.save
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


	private
		def job_params
			params.require(:job).permit(:title, :description, :city, :country)
		end

		def find_job
			@job = Job.find(params[:id])
		end
end
