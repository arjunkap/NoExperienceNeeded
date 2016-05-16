# Controls the public profiles of all companies in database
class EmployerprofileController < ApplicationController
	before_action :find_company, only: [:jobs, :show, :interview]
  
  	# Renders public profile of a given company
  	# based on company ID recieved as parameters
	def show

		# Check if a ID paramaters is recevied
  		if params.has_key?(:id) 

  			# Check if the ID exists in the company table
			if is_valid_id params[:id].to_i


				session[:comp_id] = params[:id]
				@user = User.find(@company.user_id)

			# If not then redirect to login
			else
				redirect_to login_path
			end
		# If not then redirect to login
		else
			redirect_to login_path
		end
	end

	# Renders jobs posted by the company using AJAX
	def jobs
		@jobs = Job.where(user_id: @company.user_id)
		respond_to do |format|
			format.js
		end
	end

	# Renders reviews posted by job seekers about the company
	def review
		@review = Review.where(:company_id => params[:id])
		@company_id = params[:id]
		respond_to do |format|
			format.js
		end
	end

	# Renders interview reviews posted by job seekers about the company
	def interview
		@interview = InterviewReview.where(:company_id => params[:id])
		@company_id = params[:id]
		respond_to do |format|
			format.js
		end
	end


###################################################################
# Controller helper functions


	# Check if the ID recieved in paramters is a valid ID for 
	# company record in the database.
 	def is_valid_id id
		Company.all.each do |c|
			if c.id == id
				return true
			end
		end
		return false
 	end

 	# Find company being requested else render 404 error.
 	private 
 	def find_company
		if Company.exists?(params[:id])
			@company = Company.find(params[:id])
		else
			render :file => "#{Rails.root}/public/404.html",  :status => 404
		end
	end

end
