class SessionsController < ApplicationController
  
  def new
  end


  def create
    if auth_hash = request.env['omniauth.auth']
      
#       Existing user
      if @user = User.find_by(uid: auth_hash['uid'])
        session[:user_id] = @user.id
        
        redirect_to user_path(@user)
      else
        @user = User.new(uid: auth_hash['uid'], name: auth_hash['info']['first_name'], password: SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        end
      end
    else
      @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
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