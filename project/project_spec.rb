require_relative 'project'

RSpec.describe Project do
	before(:each) do
		@project1 = Project.new('project1', 'desc1')
		@project2 = Project.new('project2', 'desc2')
	end

	it 'has a method elevator_pitch to explain name and desc' do
		expect(@project1.elevator_pitch).to eq("project1, desc1")
		expect(@project2.elevator_pitch).to eq("project2, desc2")
	end
end