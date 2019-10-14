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

  def reject 
    self.status = "rejected"
    p "Transaction rejected. Please check your account balance."
  end 
  

  def execute_transaction
    if !sender.valid? || self.status == "complete"
      reject
    elsif !receiver.valid? || sender.balance < amount
      reject 
        else 
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
    end
  end
  
  

end
