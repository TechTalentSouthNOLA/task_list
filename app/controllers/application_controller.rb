class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # To make this accessible as a "helper method", we need to declare as a helper_method. This makes it available to the controller AND the view
  helper_method :current_user

end
