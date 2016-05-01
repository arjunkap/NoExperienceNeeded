class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]

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

	def new
		@job = Job.new
	end


	def update
    if @job.update_attributes(job_params)
      redirect_to jobs_path
    else
      render 'edit'
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
