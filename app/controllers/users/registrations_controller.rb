class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new

  def create
    #Extending devise's create action to add user id for each plan
    super do |resource|
      if params[:plan] #If there are parameters of plan
        resource.plan_id = params[:plan] #Set plan id of the form they are coming from

        #Save with subscription i f coming from a pro form (id of 2)
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          #Otherwise do regular save
          resource.save
        end
      end
    end
  end

  private
  def select_plan
    #Redirect back to basic plan if user selects a plan other than the ones defined
    unless (params[:plan] == '1' || params[:plan] == '2' )
      flash[:notice] = "Please select a membership plan"
      redirect_to new_user_registration_path(plan: 1)
    end
  end
end