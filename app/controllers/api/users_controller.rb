class Api::UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.all
    @logs = @user.logs.all
    @shoes = @user.shoes.all

    render :show
  end

end
