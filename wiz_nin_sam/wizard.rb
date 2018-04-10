require_relative "human"

class Wizard < Human

	attr_accessor :person, :health,:intelligence
	def initialize(person)
		@person = person
		@health = 50
		@intelligence = 25
		
	end
	def fireball(target)
		target.health -= 20
		p "#{target.person}, #{target.health}"	
		self	
	end
	def heal
		@health += 10
		p "#{@person}, #{@health}"
		self
		
	end


end

merlin = Wizard.new("merlin")
ambrose = Wizard.new("ambrose")
merlin.fireball(ambrose)
ambrose.heal.heal
ambrose.fireball(merlin)
merlin.heal.heal