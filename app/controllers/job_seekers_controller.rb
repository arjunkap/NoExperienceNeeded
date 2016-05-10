class JobSeekersController < ApplicationController

	def index

		user = User.find_by(id: params[:id])
		@message = "this is generic user profile"
		if is_same_as_logged_in_user user
			@message = "Hi #{user.first_name}"
		end
	end


	def show

	end


	def destroy

	end



	def create

	end


	def update

	end

	def is_same_as_logged_in_user user
		return user == current_user
	end

end