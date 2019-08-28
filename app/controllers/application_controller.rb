class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :company?
  helper_method :seeker?

  def company?
    current_user && current_user.role == "company"
  end

  def seeker?
    current_user && current_user.role == "seeker"
  end

  private 

  def after_sign_in_path_for(resource)
    if resource.role == 'seeker'
      seekers_path
    else
      jobs_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
