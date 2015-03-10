class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:create]

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to users_url
    else
      redirect_to new_sessions_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :photo_url)
  end

end
