class EmployerprofileController < ApplicationController
	before_action :find_company, only: [:jobs, :show, :interview]
  
	def show
  		if params.has_key?(:id) 

			if is_valid_id params[:id].to_i
				session[:comp_id] = params[:id]
				@user = User.find(@company.user_id)
			else
				redirect_to login_path
			end
		else
			redirect_to login_path
		end
	end

	def jobs
		@jobs = Job.where(user_id: @company.user_id)
		respond_to do |format|
			format.js
		end
	end

	def review
		@review = Review.where(:company_id => params[:id])
		@company_id = params[:id]
		respond_to do |format|
			format.js
		end
	end

	def interview
		@interview = InterviewReview.where(:company_id => params[:id])
		@company_id = params[:id]
		respond_to do |format|
			format.js
		end
	end


 	def is_valid_id id
		Company.all.each do |c|
			if c.id == id
				return true
			end
		end
		return false
 	end

 	private 
 	def find_company
		if Company.exists?(params[:id])
			@company = Company.find(params[:id])
		else
			render :file => "#{Rails.root}/public/404.html",  :status => 404
		end
	end

end
