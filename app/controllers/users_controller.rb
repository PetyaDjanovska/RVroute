class UsersController < ApplicationController
   skip_before_action :require_login, only: [:new, :create]

   
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end