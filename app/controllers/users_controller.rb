class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  # def new
  #   @user = User.new
  #   render :new
  # end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(user)
      redirect_to users_url
    else
      fail
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :photo_url)
  end

end
