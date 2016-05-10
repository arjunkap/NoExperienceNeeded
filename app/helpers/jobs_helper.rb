module JobsHelper
	def already_short_listed? job_id
		#it assuming that current user is job seeker
		return ShortListedJob.where(job_id: job_id, job_seeker_id: current_user.job_seeker.id).count > 0

	end

	def already_applied? job_id

		return JobApplication.where(job_id: job_id, job_seeker_id: current_user.job_seeker.id).count > 0

	end
end
