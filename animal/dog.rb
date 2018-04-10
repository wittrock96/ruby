require_relative 'mammal'

class Dog < Mammal
	def pet
		@health += 5
		p "petting, health: #{@health}"
		self
	end
	def walk
		@health -= 1
		p "walking, health: #{@health}"
		self
	end
	def run
		@health -= 10
		p "running, health: #{@health}"	
		self	
	end
end
gracie = Dog.new('gracie').pet.pet.pet.walk.pet.pet.run.run.display_health