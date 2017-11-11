class SessionsController < ApplicationController
  
  # Login Page
  def new
    if current_user
      redirect_to root_path
    end
  end
  
  # Create a new session using the authenticate from our model
  def create

    user =  User.authenticate(params[:email], params[:password])
    
    if user
       # IF everyting is okay, redirect to root
      session[:user_id] = user.id
      redirect_to root_path
    else 
      # IF the login fails, return to login page with error message
      flash[:notice] = "Login failed"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to root_path
  end
end
 