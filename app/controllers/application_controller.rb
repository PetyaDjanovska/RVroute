class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  before_action :require_login, except: [:home]
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def home
  end
  
  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/"
    end
  end
end



