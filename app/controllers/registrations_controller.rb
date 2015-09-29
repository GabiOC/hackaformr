class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # @current_user = User.find(session[:user_id])
    if current_user.organizer
    redirect_to '/users/organizer_show' # Or :prefix_to_your_route
    else
    redirect_to '/users/user_show'
    end
  end
end
