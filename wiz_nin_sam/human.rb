class Human
	attr_accessor :person, :strength, :intelligence, :stealth, :health
	def initialize(person)
		@person = person
		@strength = 3
		@stealth = 3
		@intelligence = 3
		@health = 100		
	end
	def attack(target)
		if target.class.ancestors.include?(Human)
			target.health -= 10
			true
		else
			false			
		end
		
	end
end
