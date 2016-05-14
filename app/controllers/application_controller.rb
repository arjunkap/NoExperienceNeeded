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
  # unless  ActionController::Base.consider_all_requests_local
  # 	rescue_from Exception, :with => :render_404
  # end

  # private

  def render_404
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end
end
