class InterviewReviewsController < ApplicationController

	def show

		@interview = InterviewReview.find(params[:id])
		@total_votes = @interview.upvotes.count
	end

	def upvote

		@interview =  InterviewReview.find(params[:id])
		@interview.upvotes.create(job_seeker_id: current_user.job_seeker.id)
		@total_votes = @interview.upvotes.count
		respond_to do |format|
			
			format.js
		end

	end

	def create
		interview = InterviewReview.new
		interview.description = params[:description]
		interview.position = params[:position]
		interview.experience = params[:experience]
		interview.offer = params[:offer]
		interview.difficulty = params[:difficulty]
		interview.company_id = params[:company_id]
		interview.title = params[:title]
		company_name = Company.find(params[:company_id]).title
		interview.company_name = company_name
		interview.save
		redirect_var = "/employerprofile/#{params[:company_id]}"
		redirect_to redirect_var
	end	
end
