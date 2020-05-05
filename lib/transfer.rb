class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    (sender.valid? && receiver.valid?) ? true : false
  end
  
    

end
