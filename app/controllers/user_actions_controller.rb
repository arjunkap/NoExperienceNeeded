# Controles all searching in the website
class UserActionsController < ApplicationController

  # The website has multiple search forms.
  # this action recognizes different search forms and
  # different search items.
  def search
      session[:current_uri] = request.fullpath

    	search_from = params[:search_from]
      @search_type = params[:search_type]

      if @search_type == "" || @search_type == nil
        @search_type = session[:search_type]
      end

      session[:search_type] = @search_type

      # based on search type and search location
      # get a result collection
      if @search_type == "jobs"
        search_jobs search_from

      elsif @search_type == "interviews"
        search_interviews search_from
      elsif @search_type == "comp_reviews"
        find_companies_reviews search_from
      elsif @search_type == "company"
        company_search search_from
      end
   
  end

  # Search all companies in database.
  def company_search search_from

      @companies = []

      # Get search query
      if search_from == "navbar"
        query = params[:query].downcase

      elsif search_from == "refine_search"
        query = params[:company].downcase
      end
      if query == nil or query == ""
        @companies = Company.all
      else
        Company.all.each do |c|

          if c.title and c.title.downcase.include? query
            @companies.push c
          end
        end
      end
      session[:company] = query
  end

  # Sort baed on pre selected criteria
  def sort
    puts "....................................................."
    if params[:preference]
      if params[:preference] == "recent"
        puts "recent----"
        @jobs = Job.order(:created_at => :desc)
      elsif params[:preference] == "closing_soon"
        puts "..............closing date"
        @jobs = Job.order(closing_date: :desc)
      else
        @jobs = Job.all
      end
    end
    puts @jobs.count
   respond_to do |format|
      format.js
    end

  end

  # Search companies that contain words passed
  # as arguments to the function
  def search_companies word
      
      @company = []

      # return all companies if word is empty
      if word == ""
        @company = Company.all
      else 
         Company.all.each do |c|

            # Check if company title includes the word
            if c.title.downcase.include? word.downcase
              @company.push c
            end
          end
      end
  end  

  # Find reviews based on where search is carried out
  private
  def find_companies_reviews search_from

      # Apply filter if refined search
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
        # Do basic title matching if searched from nav bar and welcome page
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

 # search interviews based on search location
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


  # refines a collection of interview review based on company filter
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


  # Search jobs based on location of search
  def search_jobs search_from
    if search_from == "welcome_page_search" || search_from == "navbar"
        query = params[:query]
        
        if query == "" || query == nil
          @jobs = Job.all
          session[:company] =  ""
          session[:work_type] =  ""
          session[:city] = ""
          session[:sub_industry] = ""
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
    end
  end

  # refine job collection based on type of work
  def refine_with_work_type jobs, work_type
    refined_jobs = []
    if work_type == ""
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

  # refine job collection based on city of work
  def refine_with_city jobs, city

    refined_jobs = []

    if city == ""
      return jobs
    end
    jobs.each do |job|
      if job.city == city
        refined_jobs.push job
      end
    end

    return refined_jobs

  end

  # refine based on industry of the job
  def refine_with_work_industry jobs , industry

    if industry == ""
      return jobs
    end
    refined_jobs = []
    if SubIndustry.exists?(industry)
      sub_name = SubIndustry.find(industry).name
      jobs.each do |job|
        if job.category == sub_name
          refined_jobs.push job
        end
      end
      return refined_jobs
    end
  end

  # Finds interview review for a given company
  def find_interview_or_review_for_companies company, model

    collection = []
    if model == :interview_review
      pre_collection = InterviewReview.all
    elsif model == :review
      pre_collection = Review.all
    end
    pre_collection.each do |item|
      if item.company_name and item.company_name.downcase.include? company
        collection.push item
      end
    end
    return collection
  end



  # search based on title of the record
  # simple match with the title and the word
  def search_with_title word, model
  	collection = []
  	if model == :job
  		Job.all.each do |job|
  		  if job.title.downcase.include? word
          collection.push job
        end
  		end
  	
  	elsif model == :company
  		Company.all.each do |company|
  		  if company.title and company.title.downcase.include? word
          collection.push company
        end
  		end
    elsif model == :interview
      InterviewReview.all.each do |ir|
        if ir.description and ir.description.downcase.include? word
          collection.push ir
        end
      end
    elsif model == :review

      Review.all.each do |review|
        if (review.title and review.title.downcase.include? word) or (review.description and review.description.downcase.include? word)
          collection.push review
        end
      end
      
  	end

  	return collection
  end


  # Seach with query matches all the terms in the query with
  # the collection text and returns a new collection of results
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
