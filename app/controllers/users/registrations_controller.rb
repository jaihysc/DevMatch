class Users::RegistrationsController < Devise::RegistrationsController
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
end