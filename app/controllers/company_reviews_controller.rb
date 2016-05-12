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

	private


end
