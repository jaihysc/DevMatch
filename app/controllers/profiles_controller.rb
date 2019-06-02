class ProfilesController < ApplicationController
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
      redirect_to root_path
    else
      flash[:alert] = "An error occurred"
      render action :new
    end
  end

  private
    def profile_params
      params.require(:profile).permit( :first_name, :last_name, :display_name, :job_title, :phone_num, :contact_email, :description)
    end
end