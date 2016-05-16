class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include JobsHelper
  include InterviewReviewsHelper


  def not_found
  	raise ActionController::RoutingError.new('Not Found')
  end
 
  # renders '404 : page not found error' on unexpected input
  def render_404
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end


end
