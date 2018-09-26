class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def home
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_signin
    redirect_to root_path unless session.include? :user_id
  end
end
