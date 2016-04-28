class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end
end
