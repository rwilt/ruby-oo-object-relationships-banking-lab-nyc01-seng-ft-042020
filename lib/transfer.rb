class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer_counter = 0
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && status == "pending" && self.sender.balance > @amount
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status ="complete"
    else
      self.status ="rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end

  end

end
