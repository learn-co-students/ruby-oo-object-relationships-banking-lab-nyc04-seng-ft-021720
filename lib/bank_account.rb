class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    
    
        def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end 


    def deposit(number)
        @balance += number 
    end 

    def display_balance
         "Your balance is $#{self.balance}."
    end 

    def status
        if self.balance > 0 
            @status 
        else 
            @status = 'closed'
        end 
    end 

    def valid?
    
        balance > 0 && status != 'closed'
         
    end 

    def close_account
        @status = 'closed'
    end 

end

