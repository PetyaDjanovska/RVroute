class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :name, :message => "has been taken"
  validates_presence_of :name, :message => "can't be blank"
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
  
  has_many :favorites
  has_many :campsites, through: :favorites
  has_many :comments

end
