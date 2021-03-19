class AddRankingIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :ranking_id, :integer
  end
end
