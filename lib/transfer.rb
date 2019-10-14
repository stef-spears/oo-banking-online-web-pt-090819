require 'pry'

class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid? 
   sender.valid? && receiver.valid?
  end

  def execute_transaction
  
  if sender.balance < amount
    
    binding.pry
    self.status = "rejected"
      p "Transaction rejected. Please check your account balance."
    elsif 
      self.status != "complete" && sender.balance >= amount
        sender.balance -= amount
        receiver.deposit(amount)
        self.status = "complete"
   end
  end 

end
