class SessionsController < ApplicationController

  skip_before_filter :require_login
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:login], params[:user][:password])

    if log_in!(@user)
      redirect_to root_url
    else
      flash[:error] = ["Invalid Login"]
      redirect_to new_sessions_url
    end

  end

  def destroy
    log_out!
    redirect_to new_sessions_url
  end

  def omniauth
    @user = User.find_or_create_by_auth_hash(auth_hash)
    fail

    if @user.email
      log_in!(@user)
      redirect_to root_url
    else
      render :omniauth
    end

  end

  private
  def redirect_if_logged_in
    redirect_to root_url if logged_in?
  end

  protected
  def auth_hash
    request.env['omniauth']
  end

end
