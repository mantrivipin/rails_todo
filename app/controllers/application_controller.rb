class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not authorized to see this content"
    redirect_to root_path
  end
  
  private
    
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:name, :email, :password)}
  end
end
