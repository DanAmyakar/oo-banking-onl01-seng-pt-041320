class Transfer
  
  attr_accessor :status
  attr_reader :sender, :reciver, :amount
  @@all = []
  
  def initialize(sender, reciver, amount)
    @sender = sender
    @reciver = reciver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    (sender.valid? && reciver.valid?) ? true : false
  end
  
    

end
