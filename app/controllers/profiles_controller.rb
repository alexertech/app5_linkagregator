class ProfilesController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end


  # PATCH/PUT /users/1
  def update

      # First receive the user params
      updateparms = user_params

      # Now we add a pass_hash to the params with the new password
      if !updateparms[:password].empty?
        updateparms[:pass_hash] = BCrypt::Engine.hash_secret(updateparms[:password], @profile.pass_salt)
      end

      # The update method will do the rest of the work
      if @profile.update(updateparms)
        redirect_to profile_path, notice: 'Data successfully updated.'
      else
        render :edit
      end

    end

  private
  def set_user
    @profile = User.find(current_user.id)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
