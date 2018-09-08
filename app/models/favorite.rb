class Favorite < ApplicationRecord
  validate :no_repeat_favorites
  belongs_to :user
  belongs_to :campsite
  
  def no_repeat_favorites
    existing_favorites = Favorite.where(campsite_id: campsite_id, user_id: user_id) 
  
    if existing_favorites.exists? 
      errors.add :favorite, 'already added to Favorites'
    end
  end
  
  def self.most_favorite
    best_id = Favorite.all.group(:campsite_id).count.max_by{|k,v| v}[0]
    Campsite.find(best_id)
  end
end