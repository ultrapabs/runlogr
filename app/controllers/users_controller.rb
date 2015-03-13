class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:create]

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_sessions_url
    end
  end

  def edit
    @user = current_user
    fail
    if (@user.nil? || params[:id] != @user.id)
      redirect_to root_url
    else
      render :edit
    end
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :photo_url)
  end

end
