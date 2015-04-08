class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:create]

  def create
    @user = User.new(user_params) unless @user

    if params[:user][:provider] && params[:user][:uid]
      @user.provider = params[:user][:provider]
      @user.uid = params[:user][:uid]
    end

    if @user.save
      log_in!(@user)
      redirect_to '#feed'
    else
      flash[:errors] = @user.errors.full_messages
      if @user.provider
        render 'sessions/omniauth'
      else
        redirect_to new_sessions_url
      end

    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
