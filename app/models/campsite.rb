class Campsite < ApplicationRecord
  validates :name, :uniqueness => true
  validates :name, :presence => true
  has_many :favorites
  has_many :users, through: :favorites
  has_many :comments
  
  def self.find_by_location(location)
     where("address LIKE ?", location).order(:name)
  end
end
