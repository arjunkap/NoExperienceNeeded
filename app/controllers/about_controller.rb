# Controls the about us page.
# About us page contains carousel with description
# and image of each team member of team: Grace. 
class AboutController < ApplicationController
  
  # Renders about us landing page.
  def index
  end

  # Renders text related to the current item on display
  # in the carousel using AJAX.
  def team_member
  	
    # Recieve parameter using HTTP Request and find the 
    # relevant team member from the database
    @member = TeamMember.find_by(name: params[:name])
  	
    # Prints name of the team members on console. [TESTING]
    puts "-----------------" + @member.name


    # Renders a javascript page that changes the team member
    # currently being displayed.
  	respond_to do |format|
  		format.js
  	end

  end

  
end
