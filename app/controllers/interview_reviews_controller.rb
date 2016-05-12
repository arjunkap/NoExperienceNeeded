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
end
