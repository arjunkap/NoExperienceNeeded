module UsersHelper
	
  def is_job_creator job
    user = current_user
    if !user
    	return false
    end
    return job.user_id == user.id
  end



end
