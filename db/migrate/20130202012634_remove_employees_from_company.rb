class RemoveEmployeesFromCompany < ActiveRecord::Migration
  def up
  	remove_column :companies, :employees
  end

  def down
  	add_column :companies, :employees, :integer
  end
end
