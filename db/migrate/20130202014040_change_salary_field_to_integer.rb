class ChangeSalaryFieldToInteger < ActiveRecord::Migration
  def up
  	change_column :employees, :salary, :integer
  end

  def down
  	change_column :employees, :salary, :float
  end
end
