require 'pry'

class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    save
  end
  
  def save
    @@all << self
  end
  
  def deposit(qnty_to_deposit)
    @balance = @balance + qnty_to_deposit
    @balance
  end
  
  def withdrawl(qnty_to_withdrawl)
    @balance = @balance  - qnty_to_withdrawl
    @balance
  end
  
  def display_balance
    'Your balance is $' + @balance.to_s + '.'
  end
  
  def valid?
    (@status == 'open' && @balance > 0) ? true : false
  end
  
  def close_account
    self.balance = 0
    self.status = 'closed'
  end

end
