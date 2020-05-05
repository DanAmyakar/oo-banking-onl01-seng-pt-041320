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
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
end
