class UsersController < ApplicationController
  before_action :authenticate_user!

  #GET to /users/:id
  def show #Show SHOW action for a SINGLE resource
    @user = User.find(params[:id])
  end

  def index
    @users = User.includes(:profile) #Use this instead of .all to save on performance
  end
end