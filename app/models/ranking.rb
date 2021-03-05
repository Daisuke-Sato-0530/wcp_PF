class Ranking < ApplicationRecord
  belongs_to :user
  has_many :items,dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true #RankingとItemsを同時に保存する
end
