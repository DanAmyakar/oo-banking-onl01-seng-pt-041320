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
    if @sender.balance > @amount
      if @status != 'complete'
        if self.valid? == true
          @sender.withdrawl(@amount)
          @receiver.deposit(@amount)
          @status = 'complete'
        else
          @status = 'rejected'
          "Transaction rejected. Please check your account balance."
        end
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
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
