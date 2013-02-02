class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.float :salary
      t.integer :company_id

      t.timestamps
    end
  end
end
