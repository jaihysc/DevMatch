class UsersController < ApplicationController
  before_action :authenticate_user!

  #GET to /users/:id
  def show #Show SHOW action for a SINGLE resource
    @user = User.find(params[:id])
  end
end