class Item < ApplicationRecord
  belongs_to :ranking
  has_many :comments,dependent: :delete_all
  has_many :favorites,dependent: :delete_all
  attachment :image
  
  validates :name, presence: true
  validates :body, length: { maximum: 100 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists? #userが既にいいねしているかを確認するメソッド
  end

end
