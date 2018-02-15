require 'pry'
class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount, :valid?

  attr_reader

  def initialize ( sender, receiver, transfer)
    self.sender = sender
    self.receiver = receiver
    self.status = "pending"
    self.amount = transfer
  end

  def valid?
    self.sender.balance >= 1 && self.receiver.balance >=1 #can check that both accounts are valid
    #binding.pry
  end

  def execute_transaction
    if self.sender.valid? && self.receiver.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    elsif
      puts "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.execute_transaction
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
