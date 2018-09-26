class ApplicationController < ActionController::Base
  def home
  end

  helper_method :current_user
  helper_method :logged_in?
end
