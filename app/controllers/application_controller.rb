class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include SetCurrentRequestDetails

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_in_path_for(resource)
    if current_user
      users_path
    else
      root_path
    end
  end

end
