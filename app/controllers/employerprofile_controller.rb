class EmployerprofileController < ApplicationController

  	public
	def show
  		if params.has_key?(:id) 

			if is_valid_id params[:id].to_i
				session[:comp_id] = params[:id]
				@company = Company.find(params[:id])
				@user = User.find(@company.user_id)
			else
				redirect_to login_path
			end
		else
			redirect_to login_path
		end
	end

	public
	def jobs
		@jobs = Job.where(user_id: Company.find(params[:compid]).user_id)
		respond_to do |format|
			format.js
		end
	end

	public
	def review
		@review = Review.where(:company_id => params[:compid])
		respond_to do |format|
			format.js
		end
	end

public
	def interview
		@interview = InterviewReview.where(:company_id => params[:compid])
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

end
