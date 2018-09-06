class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new
    @user= User.new
    render :layout => "no_nav"
  end


  def create
    if auth_hash = request.env['omniauth.auth']
      
#       Existing user
      if @user = User.find_by(uid: auth_hash['uid'])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
#         New user
        @user = User.new(uid: auth_hash['uid'], name: auth_hash['info']['first_name'], password: SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        end
      end
    else
      @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else 
          redirect_to '/'
        end
    end
  end
  
  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end