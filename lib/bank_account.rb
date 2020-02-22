class BankAccount
	attr_reader		:name
	attr_writer		
	attr_accessor	:balance, :status

	@@all = []

	def initialize(name)
		@name = name
		@balance = 1000
		@status = 'open'
		@@all.push(self)
	end

	def self.all
		@@all
	end



	def deposit(amount)
		if amount > 0
			@balance += amount
		end
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
		@balance > 0 && @status == 'open'
	end

	def close_account
		@status = 'closed'
	end


end
