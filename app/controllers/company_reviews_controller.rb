# Controls CRUD operations on company reviews.
class CompanyReviewsController < ApplicationController

	# Renders a company review page based on parameter
	# passed at the time of calling the URL.
	def show
		@review = Review.find(params[:id])
	end

	# Creates a company review using parameters recieved in
	# the HTTP get request. 
	def create

		# Initiate a new review object
		review = Review.new

		# Populate object with information passed as parameters
		review.rating = params[:rating]
		review.title =  params[:title]
		review.description = params[:description]
		review.company_id = params[:company_id]

		# Find the name of company being reviewed using its ID
		# in companies table.
		company_name = Company.find(params[:company_id]).title
		review.company_name = company_name
		review.save

		# Redirect to the company page of the company being reviewed
		# Once a new review is saved.
		redirect_var = "/employerprofile/#{params[:company_id]}"
		redirect_to redirect_var
	end


end
