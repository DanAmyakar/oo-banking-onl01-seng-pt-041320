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
    valid_flag = false
    if (sender.valid? == true && receiver.valid? == true)
      valid_flag = true if sender.balance > amount
    else
      valid_flag
    end
  end
  
  def execute_transaction
    if @@all.none?{|xfer| xfer == self}
      if self.valid? == true
        @sender.withdrawl -= @amount
        @receiver.deposite += @amount
        @status = 'complete'
      else
        @status = 'rejected'
        puts 'Transaction rejected. Please check your acount balance.'
      end
    end
  end
  
end
