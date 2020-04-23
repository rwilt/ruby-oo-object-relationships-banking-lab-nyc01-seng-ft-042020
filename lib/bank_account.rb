# we have two classes (bank account and transfer)
# we know that the transfer class will process the transaction and check the validity of the bank account class
# transfer instances can reject transfers depending on status
# transfer classes start out pending 
# once transfer is executed it will be changed to complete
# can be rejected or reversed 

class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    def initialize(name)
        @name = name
        @balance = 1000 # default, can't change
        @status = "open"
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}." #Elvis = BankAccount.new(Elvis's_account) = --- is ELvis
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            return true
        else
            return false
        end
    end

    def close_account
        self.status = "closed"
    end
end
