require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    return @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    # binding.pry
    if @sender.balance - @amount < 0 || !valid?
      @sender.status = 'rejected' 
      @receiver.status = 'rejected'
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance." 
    elsif @status == 'pending'
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = 'reversed'
    end
  end

end
