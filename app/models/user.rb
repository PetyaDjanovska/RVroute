class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true
  validates :name, presence: true
  
  has_many :favorites
  has_many :campsites, through: :favorites
  has_many :comments
end
