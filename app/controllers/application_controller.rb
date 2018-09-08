class ApplicationController < ActionController::Base
  before_action :require_login, except: [:home]
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def home
    render :layout => "no_nav"
  end
  
  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/"
    end
  end
end



