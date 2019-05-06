class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :original_text
      t.text :corrected_text

      t.timestamps
    end
  end
end
