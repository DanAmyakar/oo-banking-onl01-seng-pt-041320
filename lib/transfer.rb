require 'pry'

class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    save
  end
  
  def save
    @@all << self
  end
  
  def valid?
    (sender.valid? && receiver.valid?) ? true : false
  end
  
  def execute_transaction
    if self.valid?
      @sender.withdrawl(amount)
      @receiver.deposit(amount)
      @status = 'complete'
    else
      "Transaction rejected. Please check your account balance."
      @status = 'rejected'
    end
  end
  
  binding.pry
  
end
