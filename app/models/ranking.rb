class Ranking < ApplicationRecord
  acts_as_taggable #tagのgemつかえるようにするやつ
  belongs_to :user
  has_many :items,dependent: :delete_all
  accepts_nested_attributes_for :items, allow_destroy: true #RankingとItemsを同時に保存する
  
  validates :title, presence: true
  validates :title, length: { in: 2..30 }     # 2文字以上30文字以下
  validates :introduction, length: { maximum: 500 }     # 500文字以下
  validates :items, presence: true #アイテムを最低一つは登録
end
