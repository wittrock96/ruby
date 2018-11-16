class Tree
	attr_accessor :age

	def initialize
		@age = 10
		@height = 10
		@apple = 20
		

		
	end
	def show_age
		return p @age
		self
	end
	def year_gone_by
		yield @age += 1
		yield @height += @height * 0.10
		if @age < 4
			yield @apple = 0
		else
			yield @apple +=2
			
		end
	def pick_apples
		@apple = 0
		return "apples picked, #{@apple}"

		
	end
		


	end

end	

# tree1 = Tree.new

# tree1.height = 20
