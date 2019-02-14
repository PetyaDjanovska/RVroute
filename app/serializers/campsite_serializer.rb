class CampsiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :description
  has_many :favorites
  has_many :users, through: :favorites
end
