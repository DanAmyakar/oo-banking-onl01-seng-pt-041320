require 'pry'

class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  @@all = []
  
  def initialize(sender, receiver, amount)
    # binding.pry
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
    valid_flag = false
    if (sender.valid? == true && receiver.valid? == true)
      valid_flag = true
    else
      valid_flag
    end
    valid_flag
  end
  
  def execute_transaction
    if @status == 'pending'
      if (self.valid? == true)
        @sender.withdrawl(@amount) if @sender.balance > @amount.to_i 
        @receiver.deposit(@amount)
        @status = 'complete'
      end
    else (sender == nil || @sneder.balance.to_i < @amount.to_i)
      "Transaction rejected. Please check your acount balance."
      @status = 'rejected'
      
    end
  end
  
  def reverse_transfer
    if @status == 'complete'
      a = self.amount
      b = self.sender
      c = self.receiver
      b.deposit(a)
      c.withdrawl(a)
      @@all.last.status = 'reversed'
    end
  end
  
end
