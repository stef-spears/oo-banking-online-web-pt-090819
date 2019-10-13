class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @all << self 
  end
  
  def deposit(amount)
    @balance += amount.to_i
  end
  
  def display_balance
    p "Your balance is $#{@balance}."
  end 
  
  def valid?
    self.status == "open" && self.balance > 0 
  end
  
  def close_account
    @status = "closed"
  end 

end
