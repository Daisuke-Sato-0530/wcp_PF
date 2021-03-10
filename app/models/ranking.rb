class Ranking < ApplicationRecord
  acts_as_taggable #tagのgemつかえるようにするやつ
  belongs_to :user
  has_many :items,dependent: :delete_all
  accepts_nested_attributes_for :items, allow_destroy: true #RankingとItemsを同時に保存する
end
