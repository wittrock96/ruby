class BankAccount
	attr_accessor :id, :name, :checking_account, :saving_account, :count
		@@count = 0
	def initialize(cus_name)
		@id = account_number
		@name = cus_name
		@checking_account = 0
		@saving_account = 0
		@@count += 1
	end
	def show_number
		return @id
		self
		
	end
	def show_checking
		return "checkings: #{@checking_account}"
		self
		
	end
	def show_saving

		return "savings: #{@saving_account}"
		self
		
	end
	def dep_checking(money)
		return 'depositing checkings'
		@checking_account += money + interest_rate(money)
		self
		
	end
	def dep_saving(money)
		p 'despositing savings'
		@saving_account += money + interest_rate(money) 
		self
	end
	def withdraw(account, money)
		if account == "saving"
			
			if money > @saving_account
				raise "insufficient funds in savings"
			else
				@saving_account -= money
			end
		elsif account == "checking"
			if money > @checking_account
				raise "insufficient funds in checkings"
			else
				@checking_account -= money
			end			
		end
		self		
	end
	def total
		return  "total: #{@checking_account + @saving_account}"
		self
		
	end
	def accounts
		@@count
		raise "you don't have access to this information"
		
	end
	def account_information
		p @id
		p @checking_account + @saving_account
		p @saving_account
		p @checking_account
		
	end


	private
	def account_number
		return rand(9999)
		
	end
	def interest_rate(money)
		return money * 0.01
		
		
	end

end
# cole = BankAccount.new('cole')
# cole.show_number
# cole.show_saving
# cole.dep_saving(1000).show_saving
# cole.show_checking
# cole.dep_checking(1000).show_checking
# cole.withdraw("checking", 500).show_checking
# cole.withdraw("checking", 800).show_saving
# cole.total
# cole.accounts
# cole.account_information
# tony = BankAccount.new('tony')
# tony.show_number
# tony.accounts
# tony.account_information
# cole.interest_rate(200, 20)