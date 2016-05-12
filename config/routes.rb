Rails.application.routes.draw do

  # get 'user_actions/search'

  get 'jobs/:id/apply' => "jobs#apply"
  get 'jobs/active' => 'jobs#active_jobs'
  get 'jobs/create_new_job' => 'jobs#create_new_job'

  post 'jobs/apply' => "jobs#create_application"


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
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
