require_relative "bank_account"

RSpec.describe BankAccount do 
	before(:each) do
		@cole = BankAccount.new('cole')
		@cole2 = BankAccount.new('cole2')
	end
	it 'has a method show_checking to show the checking_account balance' do 
		expect(@cole.show_checking).to eq('checkings: 0')
		expect(@cole2.show_checking).to eq('checkings: 0')
	end
	it 'has a method total to show the total account balance' do
		expect(@cole.total).to eq('total: 0')
	end
	it "can't pull out money from withdraw(account, money)" do
		expect{@cole.withdraw('checking', 20)}.to raise_error(RuntimeError)
	end
	it "doesn't allow users to see how many accounts their are" do 
		expect{@cole.accounts}.to raise_error(RuntimeError)
	end
	it "doesn't allow users to change the interest rate" do 
		expect{@cole.interest_rate(500, 20)}.to raise_error(NoMethodError)
	end
 
end