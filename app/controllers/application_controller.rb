class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Establish an "current_user" object in the session to handle the user information
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Method that locks controllers actions, if a user is not logged, then should 
  # redirect to the login view
  def authorize
    redirect_to '/login' unless current_user
  end

  # Method that locks controllers actions, so we can define special admin actions
  # TODO: Add notice and a proper redirect
  def admin_user
    if current_user.usertype != 0
      redirect_to '/login'
    end
  end

end
