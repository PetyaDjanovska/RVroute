class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :campsite_id
  belongs_to :user
  belongs_to :campsite
end
