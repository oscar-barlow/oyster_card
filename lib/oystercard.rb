class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Top up too much. Maximum balance is £90." if makes_card_full?(amount)
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    deduct(5)
    @in_journey = false
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
