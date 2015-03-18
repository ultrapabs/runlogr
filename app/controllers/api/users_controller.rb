class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.includes(
      {:logs => :user},
      {:blogs => :author},
      {:shoes => :logs},
      :follows_leads
    ).find(params[:id])
    @blogs = @user.blogs
    @logs = @user.logs
    @shoes = @user.shoes
    @current_user = current_user

    render :show
  end

  def update
    @user = current_user
    @current_user = @user

    if @user.update!(user_params)
      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :profile_pic)
  end

end
