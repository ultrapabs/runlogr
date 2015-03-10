class SessionsController < ApplicationController

  skip_before_filter :require_login
  before_action :redirect_if_logged_in

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:login], params[:user][:password])

    if log_in!(user)
      redirect_to users_url
    else
      render :new
    end

  end

  def destroy
    log_out!
    redirect_to users_url
  end

  private
  def redirect_if_logged_in
    redirect_to users_url if logged_in?
  end


end
