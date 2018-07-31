class SessionsController < ApplicationController
  
  def new
  end

  def create
    if !params[:name].blank?
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end
    end
  end
end