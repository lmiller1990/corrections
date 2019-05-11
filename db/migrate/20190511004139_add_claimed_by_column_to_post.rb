class AddClaimedByColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :claimed_by, :integer, null: true
  end
end
