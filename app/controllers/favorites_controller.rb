class FavoritesController < ApplicationController
  
 def index
   @campsites = current_user.campsites
   render 'index'
 end
 
 def create
   @campsite = Campsite.find_by(id: params[:campsite_id])
   @favorite = Favorite.new
   @favorite.campsite_id = @campsite.id
   @favorite.user_id = current_user.id
   @favorite.note = params[:note]
   if @favorite.save
    redirect_to favorites_path
   else
    flash[:message] = @favorite.errors.messages[:favorite].first
    redirect_to campsites_path
   end
 end
 
 def most_favorite
   Favorite.most_favorite
 end
end