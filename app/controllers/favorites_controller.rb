class FavoritesController < ApplicationController
  
 def create
   @campsite = Campsite.find_by(id: params[:campsite_id])
   @favorite = Favorite.new
   @favorite.campsite_id = @campsite.id
   @favorite.user_id = current_user.id
 end
end