class RemoveCategoryFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :category
  end

  def down
  	add_column :users, :category, :string
  end
end
