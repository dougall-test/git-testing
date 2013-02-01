class Category < ActiveRecord::Base
  attr_accessible :name, :value_range, :value_range_start, 
                  :value_range_end

  serialize :value_range
  has_many :users

  attr_accessor :value_range_start, :value_range_end
  validate :value_range_valid

  before_save :save_value_range

	def value_range_start
		if value_range
			value_range[0]
		else	
			@value_range_start
		end	
	end  

	def value_range_end
		if value_range
			value_range[1]
		else	
			@value_range_end
		end	
	end  	

  def value_range_valid
  	value_range_start = @value_range_start.to_i
  	value_range_end = @value_range_end.to_i
  	if @value_range_start.present?
	  	if value_range_start < 0 || value_range_start > 100
	  		errors.add :value_range_start, 'must be between 0 and 100'
	  	end
	  	if value_range_start.class != Fixnum
	  		errors.add :value_range_start, 'must me a number'
	  	end
  	end

  	if @value_range_end.present?
	  	if value_range_end < 0 || value_range_end > 100
	  		errors.add :value_range_end, 'must be between 0 and 100'
	  	end
	  	if value_range_end.class != Fixnum
	  		errors.add :value_range_end, 'must me a number'
	  	end
  	end	
  end

  def save_value_range
  	value_range_start = @value_range_start.to_i
  	value_range_end = @value_range_end.to_i
  	self.value_range = [value_range_start, value_range_end]
  end
end
