class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
