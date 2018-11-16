require_relative "apple_tree"

RSpec.describe Tree do
	before(:each) do
		@tree1 = Tree.new
	end
	it "has a method show_age to get the age of the tree" do
		expect(@tree1.show_age).to eq(10)
	end
	it "doesn't allow the user to change the height" do
		expect{@tree1.height = 20}.to raise_error(NoMethodError)
	end
	it "doesn't allow users to change the apple count" do
		expect{@tree1.apple = 30}.to raise_error(NoMethodError)
	end
	it "has a method year_gone_by that increasings it's age, height, and apple count" do
		output = []
		@tree1.year_gone_by do |i|
			output << i
		end
		expect(output).to eq([11,11,22])
	end
	it "has a mehtod pick_apples that takes all the apples off the tree" do
		expect(@tree1.pick_apples).to eq("apples picked, 0")
	endsubl

end