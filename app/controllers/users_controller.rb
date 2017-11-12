class UsersController < ApplicationController
  before_action :authorize, except: [:register]
  before_action :admin_user, except: [:register]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/new
  def register
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create

    # Create a new user
    @user = User.new(user_params)

    # Encrypt the password
    @user.pass_salt = BCrypt::Engine.generate_salt
    @user.pass_hash = BCrypt::Engine.hash_secret(@user.password, @user.pass_salt)

    # Each user has a unique salt
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
      render :show, status: :created, location: @user
    else
      render :new 
    end

  end

  # PATCH/PUT /users/1
  def update

      # First receive the user params
      updateparms = user_params

      # Now we add a pass_hash to the params with the new password
      updateparms[:pass_hash] = BCrypt::Engine.hash_secret(updateparms[:password], @user.pass_salt)

      # The update method will do the rest of the work
      if @user.update(updateparms)
        redirect_to @user, notice: 'User was successfully updated.'
        render :show, status: :ok, location: @user
      else
        render :edit
      end

    end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :usertype, :password)
    end
end
