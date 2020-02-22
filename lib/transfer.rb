class Transfer
	attr_reader		:sender, :receiver, :status, :amount
	attr_writer		
	attr_accessor

	@@all = []

	def initialize(sender, receiver, amount)
		@@all.push(self)
		@sender = sender
		@receiver = receiver
		@status = 'pending'
		@amount = amount
	end

	def self.all
		@@all
	end


	def valid?
		@sender.valid? && @receiver.valid?
	end

	def execute_transaction
		if @status == 'pending' && self.valid? && sender.balance > @amount
				sender.balance -= @amount
				receiver.balance += @amount
				@status = 'complete'
		else
			@status = 'rejected'
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if @status == 'complete'
			sender.balance += @amount
			receiver.balance -= @amount
			@status = 'reversed'
		end
	end

end
