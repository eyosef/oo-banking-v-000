require 'pry'
class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  attr_reader

  def initialize ( sender, receiver, transfer)
    self.sender = sender
    self.receiver = receiver
    self.status = "pending"
    self.amount = transfer
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    elsif
      self.status = "rejected"
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
