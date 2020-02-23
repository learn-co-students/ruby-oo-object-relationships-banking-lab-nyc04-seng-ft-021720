# one instance of the class can transfer money to another instance 
    # through a `Transfer` class

# #initialize
#   can initialize a Bank Account (FAILED - 1)
#   initializes with a name (FAILED - 2)
#   always initializes with balance of 1000 (FAILED - 3)
#   always initializes with a status of 'open' (FAILED - 4)
#   can't change its name (FAILED - 5)
# #deposit
#   can deposit money into its account (FAILED - 6)
# #display_balance
#   can display its balance (FAILED - 7)
# #valid?
#   is valid with an open status and a balance greater than 0 (FAILED - 8)
# #close_account
#   can close its account (FAILED - 9)
require 'pry'

class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    # can deposit money into its account
    def deposit(amount)
        @balance += amount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            valid = true
        else
            false
        end
    end

    def close_account
        @status = "closed"
    end

end
