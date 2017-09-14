class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up,keys:[:username,:mobile,:first_name,
  	:last_name,:role_id, :email])
	end

	rescue_from CanCan::AccessDenied  do
		redirect_to root_path, notice: "Page not Found"
	end
end
