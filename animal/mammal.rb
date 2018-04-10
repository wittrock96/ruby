class Mammal
	attr_accessor :name, :health
	def initialize(pet_name)
		@name = pet_name
		@health = 150
	end
	def display_health
		p @health		
	end
end