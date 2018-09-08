class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: [:create]

   
  def new
    @user = User.new
    render :layout => "no_nav"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "User could not be created"
      redirect_to '/'
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end