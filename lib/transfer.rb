require 'pry'

class Transfer
  attr_accessor :sender, :receiver,:amount
  attr_reader :balance, :acc_status

  def initialize(sender,reciever,amount)
  @transfer_status = "pending"
  @amount = amount
  @sender = sender
  @receiver = reciever
  end

def valid?
if sender.valid? && receiver.valid?
  puts"fafaaaaa"
  true 
else 
  false
end
end

def status

  @transfer_status
end

def execute_transaction
  
if @sender.balance < @amount || @sender.valid? == false || @receiver.valid? == false
  @transfer_status = "rejected"
  "Transaction rejected. Please check your account balance."
elsif @transfer_status == "complete"
  @transfer_status = "complete"
else
  sender.balance -= @amount
  receiver.balance += @amount
  @transfer_status = "complete"
end
end


def reverse_transfer
if @transfer_status == "complete"
  sender.balance += @amount
  receiver.balance -= @amount
 
  @transfer_status = "reversed"
end
end
end
