require_relative "bank_account.rb"

class Transfer
    attr_accessor :sender, :receiver, :amount
    attr_reader :status


    def initialize(sender, receiver, transfer_amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = transfer_amount
      @transfer = [sender, receiver, transfer_amount]
    end

    def valid?
      if @sender.valid? && @receiver.valid?
        true
      else
        false
      end
    end

    def execute_transaction
      if self.valid? && @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

    def reverse_transfer
      if @status == "complete"
        reverse = Transfer.new(@transfer[1], @transfer[0], @transfer[2])
        reverse.execute_transaction
        @status = "reversed"
      end
    end
end
