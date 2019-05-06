class AddCostInCentsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cost_in_cents, :integer
  end
end
