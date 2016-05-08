class UserActionsController < ApplicationController
  def search
  	@search_from = params[:search_from]

  	if @search_from == "welcome_page_search" || @search_from == "navbar"
  		@search_query = params[:search_query]
  		@search_type = params[:search_category]
  		
  		query_words = []
  		@jobs = search_with_query @search_query, :job
  		
	  	@jobs = @jobs.uniq
  		session[:query] = @search_query
  	elsif @search_from == "header_search"
 	
 	elsif @search_from ==  "refine_search"

 		# @refined_query = params[:refined_query]
 		# @jobs = []
 		# if @refined_query == nil || @refined_query == ""
  	# 		@jobs = Job.all
 		# else
			# @jobs = search_with_query @refined_query, :job
 		# end
 		# @jobs = @jobs.uniq
 		@company  = params[:company]
 		session[:company] = @company

 		companies = search_with_title @company, :company
 		@jobs  = []
 		companies.each do |company|
 			@jobs = @jobs + User.find(company.user_id).jobs
 		end

 		#session[:query] = @refined_query
 		query = session[:query]
 		session[:city] = params[:city]

 		session[:sub_industry] = params[:sub_industry]
 		
 		@jobs = search_with_query query, nil, {:collection => @jobs}, params[:city]

 		@jobs = search_with_query query, nil, {:collection => @jobs}, params[:sub_industry]


  	end
  end

  private
  def search_with_title word, model, options = nil, city=nil
  	collection = []
  	if options != nil
  		collection_ = options[:collection]
  		collection_.each do |entity|
  			if city
	  			if entity.title.include? word and entity.city.include? city
	  				collection.push entity
	  			end
	  		else
	  			if entity.title.include? word 
	  				collection.push entity
	  			end
	  		end
  		end
  		return collection
  	end
  	
  	if model == :job
  		Job.all.each do |job|
  			if city
  				if  job.title.include? word and job.city.include? city
					collection.push job
  				end
  			else
  				if  job.title.include? word
  					collection.push job
  				end
  			end
  		end
  	end
  	if model == :company
  		Company.all.each do |company|
  			if city
  				if  company.title.include? word and User.find(company.user_id).city.include? city
					collection.push company
  				end
  			else
  				if  company.title.include? word
  					collection.push company
  				end

  			end
  		end
  	end
  	 return collection
  end



  def search_with_query query, model, options = nil, city=nil
	query_words = []
	collection = []

	if query
		query_words = query.split()
	end
	if options != nil
		query_words.each do |word|
			collection = collection + (search_with_title(word, nil, options, city))
		end
	end
	query_words.each do |word|
		collection = collection + (search_with_title(word, model, nil, city))
	end
	return collection
  end



end
