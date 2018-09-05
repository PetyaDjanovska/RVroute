class Comment < ApplicationRecord
  validates :title, uniqueness: true
  belongs_to :campsite
  belongs_to :user
end
