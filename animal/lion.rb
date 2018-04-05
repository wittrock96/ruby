require_relative 'mammal'

class Lion < Mammal
	attr_accessor :health

	def initialize(health)
		@health = 170
		
	end
	def fly
		p "flying"
		@health -= 10
		self
	end
	def attack_town
		p "attacking"
		@health += 50
		self
	end
	def eat_humans
		p "eating"
		@health += 20
		self
		
	end

end

simba = Lion.new('simba').attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_health