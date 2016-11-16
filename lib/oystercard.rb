class Oystercard

attr_reader :balance

MAXIMUM_BALANCE = 90

def initialize
  @balance = 0
  @in_journey = false
end

def top_up(amount)
  fail "Top up too much. Maximum balance is £90. Current
  balance is #{self.balance}" if @balance + amount > MAXIMUM_BALANCE
  @balance += amount
end

def deduct(fare)
  @balance -= fare
end

def in_journey?
  @in_journey
end

def touch_out
  @in_journey = false
end

end
