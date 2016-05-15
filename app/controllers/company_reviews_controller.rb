class CompanyReviewsController < ApplicationController
	def index

	end

	def show
		@review = Review.find(params[:id])
	end

	def destroy

	end

	def edit

	end

	def create
		review = Review.new
		review.rating = params[:rating]
		review.title =  params[:title]
		review.description = params[:description]
		review.company_id = params[:company_id]
		company_name = Company.find(params[:company_id]).title
		review.company_name = company_name
		review.save

		redirect_var = "/employerprofile/#{params[:company_id]}"
		redirect_to redirect_var
	end


end
