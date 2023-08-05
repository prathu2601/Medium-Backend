class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show 
    render json: User.where(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Subscription.create(user_id: @user.id, tierfree: true, tier3d: false, tier5d: false, tier10d: false, allowedViews: 1,)
      session[:user_id] = @user.id
      render json: @user, notice: 'User was successfully created.'
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def edit 
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, notice: 'User was successfully edited.'
    else 
      render json: {}, status: :unprocessable_entity
    end
  end

  def signin
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      print(">>>>", session[:user_id], @user.id)
      session[:user_id] = @user.id
      render json: @user, notice: 'Signed in successfully.'
    else
      flash.now[:alert] = 'Invalid email/password combination.'
      render json: {}, notice: 'Invalid email/password combination.'
    end
  end

  def signout
    session[:user_id] = nil
    render json: {}, notice: 'Logged out successfully.'
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation, :firstname, :lastname, :bio, :profilepicture)
  end
end
