require_relative "bank_account.rb"

class Transfer
    attr_accessor :sender, :receiver, :amount
    attr_reader :status, :executed


    def initialize(sender, receiver, transfer_amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = transfer_amount
      @executed = "pending"
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
      if @executed != "executed"
        if self.valid? && @sender.balance > @amount
          @sender.balance -= @amount
          @receiver.balance += @amount
          @status = "complete"
          @executed = "executed"
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      else
        nil
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
