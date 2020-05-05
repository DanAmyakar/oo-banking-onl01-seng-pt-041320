require 'pry'

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
    'Your balance is $' + @balance.to_s + '.'
  end
  
  def valid?
    !(self.balance > 0 && self.status = 'open') ? true : false
  end
  
  def close_account
    self.balance = 0
    self.status = 'closed'
  end
  

end
