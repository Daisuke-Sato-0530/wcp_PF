class Item < ApplicationRecord
  belongs_to :ranking
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists? #userが既にいいねしているかを確認するメソッド
  end

end
