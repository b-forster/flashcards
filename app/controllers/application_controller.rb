class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def authorize
    redirect_to login_path, alert: 'Please log in before continuing.' if current_user.nil?
  end
end
