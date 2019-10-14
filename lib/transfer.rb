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
 binding.pry
 
  if !sender.valid? || self.status = "complete"
   self.status = "rejected"
    p "Transaction rejected. Please check your account balance."
  else 
    sender.balance -= amount
    receiver.deposit(amount)
    self.status = "complete"
  end
 
 
 
  #if !receiver.valid? || sender.balance < amount
   #   self.status != "complete" && sender.balance >= amount
     #   
   # end
  end 

end
