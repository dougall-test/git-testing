class User < ActiveRecord::Base
  attr_accessible :affinity, :category, :first_name, 
                  :last_name, :full_name, :release_date, :value,
                  :new_category, :category_id

  attr_writer :first_name, :last_name
  attr_accessor :new_category, :name
	before_save :save_name
	before_save :create_category  
	validates_presence_of :first_name, :last_name
	belongs_to :category

	def first_name
		if name
			name.split(" ").first
		else	
			@first_name
		end	
	end

	def last_name
		if name
		  name.split(" ").pop
		else
			@last_name  
		end	
	end	

  def save_name
  	self.name = "#{@first_name} #{@last_name}"
  end  

  def create_category
  	self.category = Category.create!(name: new_category) if new_category.present?
  end

	def as_json(options = {})
		s = super(options)
		s.merge({ cars: cars(@name), nuts: nuts, names: names })  	
	end  

	def self.build_object
		all.each {|user| user.name = name }
	end

	def cars(name)
		["#{name}Ford", "#{name}Honda", "#{name}Chrystler"]
	end

	def nuts
		["p-nut", "wall-nut", "other"]
	end

	def names
		["Pat", "jon", "Jerry"]
	end

end
