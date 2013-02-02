class Employee < ActiveRecord::Base
  attr_accessible :company_id, :name, :salary
end
