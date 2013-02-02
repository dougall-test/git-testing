class Employee < ActiveRecord::Base
  attr_accessible :company_id, :name, :salary_in_dollars

 	def salary_in_dollars
 		dollars = salary.to_d/100 if salary
 	end 

 	def salary_in_dollars=(dollars)
 		self.salary = dollars.to_d * 100 if dollars.present?
 	end
end
