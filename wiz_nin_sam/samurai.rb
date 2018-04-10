require_relative "human"
# require_relative "ninja"
# require_relative "wizard"
class Samurai < Human
	attr_accessor :person, :health
	@@Samurai_count = 0
	def initialize(person)
		@person = person
		@health = 200 
		@@Samurai_count += 1
		
	end
	def death_blow(target)
		target.health = 0
		p "FATALITY, #{target.health}"
		self
	end
	def meditate
		@health = 200
		p "health restored"
		self
	end
	def warriors
		p @@Samurai_count
		self 
	end
end

jack = Samurai.new('jack')
kirito = Samurai.new('kirito')

jack.death_blow(kirito).warriors
kirito.meditate