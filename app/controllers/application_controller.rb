class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:studentid, :first, :last, :role, :friend, :email,:home])
    devise_parameter_sanitizer.permit(:account_update, keys: [:dept, :room])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:studentid,])
  end
end
