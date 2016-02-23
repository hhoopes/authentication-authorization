class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #memoization so you don't have to do a db call if not necessary
  end

  protect_from_forgery with: :exception


end
