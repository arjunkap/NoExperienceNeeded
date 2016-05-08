class UserActionsController < ApplicationController
  def search
  	@search_from = params[:search_from]

  	if @search_from == "welcome_page_search"
  		@search_query = params[:search_query]
  		@search_type = params[:search_category]
  		
  		
  		if @search_query
  			query_words = @search_query.split()
  		end
  		@jobs = []
  		if query_words
	  		query_words.each do |word|
	  			@jobs = search_with_title word, :job
	  			@jobs = @jobs.uniq
	  		end
	  	end
	  	
  		session[:welcome_query] = @search_query
  	elsif @search_from == "header_search"
 	
 	elsif @search_from ==  "refine_search"
 		@refined_query = params[:refined_query]
 		if @refined_query == nil || @refined_query == ""
  			@jobs = Job.all
 		else
			if @refined_query
				query_words = @refined_query.split()
			end
	  		@jobs = []
	  		if query_words
		  		query_words.each do |word|
		  			@jobs = @jobs + Job.all.where(:title => word)
		  		end
		  	end
 			
 		end
 		@jobs = @jobs.uniq
 		session[:welcome_query] = @refined_query
  	end
  end

  def search_with_title word, model
  	jobs = []
  	if model == :job
  		Job.all.each do |job|
  			if job.include? word
  				jobs.push job
  			end
  		end
  	end
  end
  return jobs
end
