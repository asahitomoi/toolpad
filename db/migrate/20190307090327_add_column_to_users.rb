class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string

    add_column :users, :user_image_id, :string

    add_column :users, :introduce, :string

    add_column :users, :gender, :integer

    add_column :users, :age, :integer

    add_column :users, :deleted_at, :boolean

  end
end
