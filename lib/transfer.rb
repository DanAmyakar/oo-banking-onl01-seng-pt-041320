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
    @sender.withdrawl(amount)
    @receiver.deposite(amount)
  end
  
  
  
end
