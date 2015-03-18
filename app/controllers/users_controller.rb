class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:create]

  def create
    @user = User.new(user_params) unless @user

    if @user.save
      log_in!(@user)
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      if @user.provider
        render 'sessions/omniauth'
      else
        render 'sessions/new'
      end

    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
