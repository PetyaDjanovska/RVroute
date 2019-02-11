class FavoritesController < ApplicationController
  
 def index
   @favorites = current_user.favorites
  #  render 'index'
  render json: @favorites
 end
 
 def create
   @campsite = Campsite.find_by(id: params[:campsite_id])
   @favorite = Favorite.new
   @favorite.campsite_id = @campsite.id
   @favorite.user_id = current_user.id
   @favorite.note = params[:note]
   if @favorite.save
    # redirect_to favorites_path
    render json: @favorite
   else
    # flash[:message] = @favorite.errors.messages[:favorite].first
    # redirect_to campsites_path
    render json: {message: 'Unable to add to favorites!'}
   end
 end
 
 def most_favorite
   @best = Favorite.most_favorite
 end
 

end