class AddColumnUsers < ActiveRecord::Migration[5.2]
  def up
  	add_column :users, :place, :string
  end

  def down
  	remove_column :users, :place, :string
  end
end
