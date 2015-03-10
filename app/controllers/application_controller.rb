class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  before_filter :require_login

  def log_in!(user)
    return nil if user.nil?
    session[:session_token] = user.session_token
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    user = User.find_by(session_token: session[:session_token])
    user.nil? ? nil : user
  end

  private
  def require_login
    redirect_to new_sessions_url if !logged_in?
  end


end
