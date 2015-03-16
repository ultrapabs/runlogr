class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.all
    @logs = @user.logs.all
    @shoes = @user.shoes.all

    render :show
  end

  def update
    @user = current_user

    if @user.id === current_user.id && @user.update!(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :photo_url)
  end

end
