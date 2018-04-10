require_relative "human"

class Ninja < Human
	attr_accessor :person, :health
	def initialize(person)
		@person = person
		@health = 175		
	end
	def steal(target)
		target.health -= 10
		@health += 10
		p "#{@person} stole 10 health from #{target.person}, #{target.health}, #{@person}, #{@health}"
		self
	end
	def get_away
		@health -= 15
		p "#{@person}, #{@health}"
		self
		
	end

end

mean = Ninja.new('mean')
python = Ninja.new('python')

mean.steal(python)
python.get_away