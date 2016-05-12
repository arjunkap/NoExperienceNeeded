class UserActionsController < ApplicationController


  def search
    session[:current_uri] = request.fullpath

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
    elsif @search_type == "comp_reviews"
      find_companies_reviews search_from
    end
    respond_to do |format|
      format.html
      format.js

      if params[:sort_preference]
        if params[:sort_preference] == "recent"
          puts "----------------------"
          @jobs = Job.last
        elsif params[:sort_preference] == "closing_soon"
          @jobs = Job.first
        else
          @jobs = Job.all
        end
      end 
      
    end

  end

  private

  def find_companies_reviews search_from

  
    if search_from == "refine_search"
      query =  session[:query]
      company = params[:company]
      session[:company] = company

      if company == "" and query == ""
        @reviews = Review.all
      elsif company == "" and query != ""
        @reviews = search_with_query query.downcase, :review
      elsif company != "" and query == ""
        @reviews =  find_interview_or_review_for_companies company.downcase, :review
      else
        @reviews = refine_inter_review_with_companies company.downcase, query.downcase, :review
      end
    elsif search_from == "navbar" || search_from == "welcome_page_search"
      query = params[:query]
      if query == "" || query == nil
        @reviews = Review.all
      else
        @reviews =  search_with_query query.downcase, :review
        
      end
       session[:query] = params[:query]
    end
  end

  def search_company_review company, query
    collection = []
    reviews = Review.all
    
  end

 
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
        @interviews =  find_interview_or_review_for_companies company.downcase, :interview_review

      else
        @interviews = refine_inter_review_with_companies company.downcase, query.downcase, :interview_review
      end
    elsif search_from == "navbar" || search_from == "welcome_page_search"
      query = params[:query]
      if query == "" || query == nil
        @interviews = InterviewReview.all
      else
        @interviews =  search_with_query query.downcase, :interview
      
      end
       session[:query] = params[:query]
    end
    
  end



  def refine_inter_review_with_companies company, query, model
    collection = []
    if model == :interview_review
      pre_collection = InterviewReview.all
    elsif model == :review
      pre_collection = Review.all
    end
    
    pre_collection.each do |item|
      
      if item.company_name.downcase.include? company and item.description.downcase.include? query
        collection.push item
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
        @jobs =  Job.all
    
      else
        companies = search_with_title company.downcase, :company
        companies.each do |company|
        @jobs = @jobs + User.find(company.user_id).jobs
       end
      end
      if query != "" and query != nil
       @jobs = search_with_query query.downcase, :job
      end

      @jobs1 = refine_with_city @jobs, params[:city]

      @jobs2 = refine_with_work_industry @jobs1, params[:sub_industry]

      @jobs = refine_with_work_type @jobs2, params[:work_type]
  
      # @jobs = @jobs.paginate(:page => params[:page], :per_page => 25)

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

  def find_interview_or_review_for_companies company, model

    collection = []
    if model == :interview_review
      pre_collection = InterviewReview.all
    elsif model == :review
      pre_collection = Review.all
    end
    pre_collection.each do |item|
      if item.company_name.downcase.include? company
        collection.push item
      end
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
    elsif model == :review

      Review.all.each do |review|
        if review.title.downcase.include? word or review.description.downcase.include? word
          collection.push review
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
