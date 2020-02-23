# `Transfer` class acts as a space for a transaction between two 
  # instances of the bank account class
# check the validity of the accounts before the transaction occurs
# `Transfer` instances should be able to reject a transfer if the 
  # accounts aren't valid or if the sender doesn't have the money.
# Transfers start out in a "pending" status
# can be executed and go to a "complete" state
# They can also go to a "rejected" status
# A completed transfer can also be reversed and go 
  # into a "reversed" status.

class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    # execute a successful transaction between two accounts
    # transfer can only happen once
    if @status == "pending" && self.sender.balance >= amount && self.receiver.status != "closed"
      self.sender.balance -= amount
      self.receiver.deposit(amount)
      @status = "complete"
    else
      # rejects a transfer if the sender balance is too low or is not valid
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      @status = "reversed"
    end
  end

end
