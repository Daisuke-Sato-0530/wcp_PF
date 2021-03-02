class AddRankingIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ranking_id, :integer
  end
end
