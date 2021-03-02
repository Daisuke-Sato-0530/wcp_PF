class AddTitleToRankings < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :title, :string
    add_column :rankings, :introduction, :text
  end
end
