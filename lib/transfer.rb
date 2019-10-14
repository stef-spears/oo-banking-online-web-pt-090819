require 'pry'

class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount
  #attr_reader 

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
    
 #binding.pry
 
  if !sender.valid? || self.status == "complete"
    self.status = "rejected"
    p "Transaction rejected. Please check your account balance."
  elsif !receiver.valid? || sender.balance < amount
    self.status = "rejected"
    p "Transaction rejected. Please check your account balance."
  else 
    sender.balance -= amount
    receiver.deposit(amount)
    self.status = "complete"
    
  end
  
 end

end
