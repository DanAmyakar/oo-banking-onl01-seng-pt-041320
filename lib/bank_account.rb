class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end
  
  def deposit(qnty_to_deposite)
    self.balance += qnty_to_deposite
    self.balance
  end
  
  def display_balance
    self.balance
  end
  
  

end
