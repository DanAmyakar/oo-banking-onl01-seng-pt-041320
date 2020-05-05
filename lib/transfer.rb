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
    if @@all == @@all.uniq
      if (self.valid? == true && sender.balance > amount)
        self.sender.withdrawl(@amount)
        self.receiver.deposit(@amount)
        self.status = 'complete'
      end
    else
      self.status = 'rejected'
      puts 'Transaction rejected. Please check your acount balance.'
    end
  end
  
  def reverse_transfer
    
  end
  
end
