class ApplicationController < ActionController::Base

  #Whitelist input parameters to prevent injection of additional parameters i f coming from a devise signup form
before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation)}
    end
end
