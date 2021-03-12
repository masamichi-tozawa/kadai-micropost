class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites
  
  validates :content, presence: true, length: { maximum: 255 }
end
