class Item < ApplicationRecord
  belongs_to :ranking
  has_many :comments,dependent: :destroy
  
  attachment :image
end
