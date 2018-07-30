class User < ApplicationRecord
  has_many :favorites
  has_many :campsites, through: :favorites
  has_secure_password
end
