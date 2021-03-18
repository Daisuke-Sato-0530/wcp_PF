class AddFavoritesToRankings < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :favorites, :integer, default: 0
  end
end
