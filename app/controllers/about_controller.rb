class AboutController < ApplicationController
  def index
  end

  def team_member
  	@member = TeamMember.find_by(name: params[:name])
  	puts "-----------------" + @member.name
  	respond_to do |format|
  		format.js
  	end
  end
end
