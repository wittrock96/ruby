class Project
	def initialize(pro_name, desc)
		@name = pro_name
		@desc = desc
		p "created project"
	end
	def elevator_pitch
		p "#{@name}, #{@desc}"
	end
end

project1 = Project.new("thisproject", "it does something")
project1.elevator_pitch