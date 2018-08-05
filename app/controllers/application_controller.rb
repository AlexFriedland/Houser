class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def authentication_required
    if !logged_in?
      redirect_to '/login'
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #methods built in controllers don't permeate to actionview of code
  #can't call this in html.erb unless declared as helper_method
  helper_method :current_user
end
