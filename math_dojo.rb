class MathDojo
	attr_accessor :total
	def initialize
			@total = 0
		
	end
	def add(*params)
		for i in 0...params.length
			if params[i].respond_to?(:to_i) == true
				@total += params[i]
				
			elsif params[i].respond_to?(:to_a) == true
				for x in 0...params[i].length
					@total += params[i][x]
					
				end
			end
		end
		p @total
		self	
	end
	def subtract(*params)
		for	i in 0...params.length
			if params[i].respond_to?(:to_i) == true
				@total -= params[i]
				
			elsif params[i].respond_to?(:to_a) == true
				for x in 0...params[i].length
					@total -= params[i][x]
				
				end
			end					
		end
		p @total
		self
	end
end
challenge1 = MathDojo.new.add(2).add(2,5).subtract(3,2)
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3])
