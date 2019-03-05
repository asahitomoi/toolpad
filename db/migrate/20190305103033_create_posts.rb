class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :disease
      t.integer :activity
      t.string :post_image_id
      t.string :copy
      t.string :tip
      t.integer :user_id
      t.boolean :deleted_at

      t.timestamps
    end
  end
end
