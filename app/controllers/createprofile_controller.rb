# Creates new profile on sign up
class CreateprofileController < ApplicationController
 	def show
 		@user = User.find(params[:id])
 	end

 	def save
 		@user = User.find(params[:id])
 		@user.about = params[:about]
 		@user.web_url = params[:web_url]
 		@user.save
 		if is_current_user_job_seeker?
 			redirect_to "/profile/"
 		else 
 			redirect_path = "/employer/#{Company.find_by(user_id: @user.id).id}"
 			redirect_to  redirect_path
 		end
 	end
end
