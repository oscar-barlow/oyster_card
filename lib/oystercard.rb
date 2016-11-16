class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  FARE = 5

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top up too much. Maximum balance is £90." if makes_card_full?(amount)
    @balance += amount
  end

  def in_journey?
    @entry_station
  end

  def touch_out
    deduct(FARE)
    @entry_station = nil
  end

  def touch_in(station)
    fail "Pauper" if below_minimum_balance?
    @in_journey = true
    @entry_station = station
  end

  def makes_card_full?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def below_minimum_balance?
    @balance < MINIMUM_BALANCE
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
