class ProfilesController < ApplicationController
  before_action :authenticate_user! #Handled by devise
  before_action :authenticate_current_user

  #GET to /users/:user_id/profile/new
  def new
    #Render blank profile details form
    @profile = Profile.new
  end

  #POST to users/:user_id/profile
  def create
    @user = User.find(params[:user_id]) #Get user id
    #Create profile linked to user, use build for relations between 2 objects
    @profile = @user.build_profile(profile_params) #Auto fills foreign key with build_profile

    if @profile.save
      flash[:success] = "Profile successfully updated"
      redirect_to user_path(id: params[:user_id])
    else
      flash[:alert] = "An error occurred"
      render action: :new
    end
  end

  #users/user_id/profile/edit
  def edit
    @profile = User.find(params[:user_id]).profile
  end

  #PUT to /users/:user_id/profile
  def update
    @profile = User.find(params[:user_id]).profile

    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile successfully updated"
      redirect_to user_path(id: params[:user_id])
    else
      flash[:alert] = "An error occurred"
      render action: :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit( :first_name, :last_name, :display_name, :job_title, :phone_num, :contact_email, :description, :avatar)
    end

    #Ensure the user which the client is trying to access is themselves
    def authenticate_current_user
      @user = User.find( params[:user_id])
      unless @user == current_user
        redirect_to root_path
      end
    end
end