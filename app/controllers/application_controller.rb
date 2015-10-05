class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

#accept additional attribute for user table
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :organizer) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :organizer) }
  end

  #  def current_user
  #    return unless session[:user_id] || session[:participant_id]
  #    @current_user = User.find(session[:user_id]) || Participant.find(session[:participant_id])
  #  end
end
