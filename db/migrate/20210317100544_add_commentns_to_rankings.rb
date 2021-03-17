class AddCommentnsToRankings < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :comments, :integer, default: 0
  end
end
