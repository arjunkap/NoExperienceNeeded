module InterviewReviewsHelper
	def can_upvote? interview_id
		return Upvote.where(job_seeker_id: current_user.job_seeker.id, interview_review_id: interview_id).count == 0
	end
end
