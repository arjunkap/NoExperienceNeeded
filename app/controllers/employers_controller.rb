class EmployersController < ApplicationController
	
	def index

	end

	def show
		@active_jobs = current_user.jobs
	end

	def destroy

	end

	def create

	end

	def update

	end
end
