Rails.application.routes.draw do



  # get 'user_actions/search'

  get 'jobs/:id/apply' => "jobs#apply"
  get 'jobs/active' => 'jobs#active_jobs'
  get 'jobs/create_new_job' => 'jobs#create_new_job'

  get 'jobs/new' => 'jobs#new'

  get '/member' => 'about#team_member'

  get 'jobs/:id/applications' => 'jobs#applications'

  post 'jobs/apply' => "jobs#create_application"

  get '/shortlistedjobs' => 'jobs#short_listed_jobs'

  get '/search' => 'user_actions#search'

  post '/jobs/shortlist' => 'jobs#short_list'

  get 'who' => 'users#who'

  get '/profile/:id' => 'job_seekers#show'
  get '/profile' => 'job_seekers#show'

  get 'profile/description/:id' => 'job_seekers#edit_description'
  post 'dashboard/description' => 'job_seekers#edit_description'
  get '/profile/dashboard/:user' => 'job_seekers#dashboard'
  post '/profile/newItem' => 'job_seekers#new_portfolio_item'
  post 'profile/saveportfolioitem' => 'job_seekers#save_portfolio_item'
  post '/profile/profile/saveportfolioitem' => 'job_seekers#save_portfolio_item'
  
  get '/employerprofile/:id' => 'employerprofile#show'
  
  get '/employerprofile/jobs/:id' => 'employerprofile#jobs'
  get '/employerprofile/interview/:id' => 'employerprofile#interview'
  get '/employerprofile/review/:id' => 'employerprofile#review'


  get 'jobseeker' => 'users#job_seeker'
  
  get 'employer' => 'users#employer'

  get 'signup'  => 'users#new'

  post 'employer' => 'users#create_employer'

  post 'jobseeker' => 'users#create_job_seeker'

  get 'jobseeker/:id' => 'job_seekers#show'


  get 'cr/:id' => 'company_reviews#show'
  get 'ir/:id' => 'interview_reviews#show'
  get 'ir/:id/upvote' => 'interview_reviews#upvote'


  get 'employer/:id' => 'employers#show'

  resources :users  
  get 'sessions/new'

  resources :jobs

  get '/error', to: "error#four_o_four"

  get '/about', to: 'about#index'

  get 'welcome/index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  root 'welcome#index'

  
  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  get 'signup'  => 'users#new'
  # match '*path' => "application#render_404"
end
