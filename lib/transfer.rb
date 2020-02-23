class Transfer
  attr_accessor :name, :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid? 
      true
    else
      false
    end
  end
  
  def execute_transaction
    if @sender.balance < @amount || valid? != true
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      
    elsif @status == "complete"
      "This transaction has already been completed"
      
    else valid?
      @sender.deposit(@amount*-1)
      @receiver.deposit(@amount)
      @status = "complete"
      "Your transfer was successful"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount*-1)
      @status = "reversed"
      "The transfer has been successfully reversed"
    end
  end
end
