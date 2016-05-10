module UsersHelper
	
  def is_job_creator job
    user = current_user
    if !user
    	return false
    end
    return job.user_id == user.id
  end

  def is_current_user_employer?
  	if current_user

  		return current_user.company ? true : false 
  	end

  	return false 
  end

  def is_current_user_job_seeker?
  	if current_user 
  		return current_user.job_seeker ? true : false  
  	end
  	return false
  end


end
