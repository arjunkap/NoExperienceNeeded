class UserActionsController < ApplicationController
  def search
  	search_from = params[:search_from]
    @search_type = params[:search_type]

    if @search_type == "" || @search_type == nil
      @search_type = session[:search_type]
    end

    session[:search_type] = @search_type
    if @search_type == "jobs"
      search_jobs search_from

    elsif @search_type == "interviews"
      search_interviews search_from
    end

  end

  private

 
  def search_interviews search_from
  
    if search_from == "refine_search"
      query =  session[:query]
      company = params[:company]
      session[:company] = company
      compaines = Company.all
     
      if company == "" and query == ""
        @interviews = InterviewReview.all
      elsif company == "" and query != ""
        @interviews = search_with_query query.downcase, :interview
      elsif company != "" and query == ""
        @interviews =  find_interview_for_companies company.downcase

      else
        companies = search_with_query company.downcase, :company
        @interviews = refine_intervies_with_companies companies, query

      end
    elsif search_from == "navbar" || search_from == "welcome_page_search"
      if params[:query] == "" || params == nil
        @interviews = InterviewReview.all
      else
        @interviews =  search_with_query params[:query], :interview
      
      end
       session[:query] = params[:query]
    end
    
  end

  def refine_intervies_with_companies companies, query
    collection = []
    
    companies.each do |company|
      cr = company.interview_reviews.each do |cir|
        if cir.description.include? query
          collection.push cir
        end
      end
    end
    return collection
  end



  def search_jobs search_from
    if search_from == "welcome_page_search" || search_from == "navbar"
        query = params[:query]
        
        if query == "" || query == nil
          @jobs = Job.all
          session[:company] =  ""
          session[:work_type] =  "any"
          session[:city] = "any"
          session[:sub_industry] = "any"
        else
          @jobs = search_with_query query.downcase, :job
        end
        @jobs = @jobs.uniq
        session[:query] = query
      
    elsif search_from ==  "refine_search"

      @jobs  = []
      company = params[:company]
      session[:company] =  company
      session[:work_type] =  params[:work_type]
      session[:city] = params[:city]
      session[:sub_industry] = params[:sub_industry]
      query = session[:query]

      if company == "" || company == nil
        @jobs = Job.all
      else
        companies = search_with_title company.downcase, :company
        companies.each do |company|
        @jobs = @jobs + User.find(company.user_id).jobs
       end
      end
      if query != "" and query_words != nil
       @jobs = search_with_query query.downcase, :job
      end

      @jobs1 = refine_with_city @jobs, params[:city]

      @jobs2 = refine_with_work_industry @jobs1, params[:sub_industry]

      @jobs = refine_with_work_type @jobs2, params[:work_type]
    end
  end


  def refine_with_work_type jobs, work_type
    refined_jobs = []
    if work_type == "any"
      return jobs
    else
      jobs.each do |job|
        if job.work_type == work_type
          refined_jobs.push job
        end
      end
    end
    return refined_jobs
  end


  def refine_with_city jobs, city

    refined_jobs = []

    if city == "any"
      return jobs
    end
    jobs.each do |job|
      if job.city == city
        refined_jobs.push job
      end
    end

    return refined_jobs

  end

  def refine_with_work_industry jobs , industry

    if industry == "any"
      return jobs
    end
    refined_jobs = []
    sub_industry_id = SubIndustry.find_by(name: industry).id
    jobs.each do |job|
      if job.sub_industry_id == sub_industry_id
        refined_jobs.push job
      end
    end
    return refined_jobs

  end

  def find_interview_for_companies company

    collection = []
    companies = search_with_query company, :company

    companies.each do |company|
      collection = collection + company.interview_reviews
    end
    return collection
  end




  def search_with_title word, model
  	collection = []
  	# if options != nil
  	# 	collection_ = options[:collection]
  	# 	collection_.each do |entity|
  	# 		if city
	  # 			if entity.title.downcase.include? word.downcase and entity.city and entity.city.downcase.include? city.downcase
	  # 				collection.push entity
	  # 			end
	  # 		else
	  # 			if entity.title.downcase.include? word.downcase 
	  # 				collection.push entity
	  # 			end
	  # 		end
  	# 	end
  	# 	return collection
  	# end
  	
  	if model == :job
  		Job.all.each do |job|
  		  if job.title.downcase.include? word
          collection.push job
        end
  		end
  	
  	elsif model == :company
  		Company.all.each do |company|
  		  if company.title.downcase.include? word
          collection.push company
        end
  		end
    elsif model == :interview
      InterviewReview.all.each do |ir|
        if ir.description.downcase.include? word
          collection.push ir
        end
      end
  	end

  	return collection
  end



  def search_with_query query, model
  	query_words = []
  	collection = []

  	if query
  		query_words = query.split()
  	end
  	query_words.each do |word|
  		collection = collection + (search_with_title(word, model))
  	end
  	return collection
  end



end
