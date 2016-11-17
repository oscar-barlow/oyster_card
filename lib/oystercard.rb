require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  FARE = 5

  def initialize
    @balance = 0
    @journey = {:entry_station => nil, :exit_station => nil}
    @journeys = []
  end

  def top_up(amount)
    fail "Top up too much. Maximum balance is £90." if makes_card_full?(amount)
    @balance += amount
  end

  def in_journey?
    @journey[:entry_station] != nil
  end

  def touch_out(station)
    deduct(FARE)
    add_station_to_journey_hash("exit_station", station)
    add_journey_to_journeys_list
    clear_entry_station
  end

  def touch_in(station)
    fail "Pauper" if below_minimum_balance?
    add_station_to_journey_hash("entry_station", station)
  end

  def makes_card_full?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def below_minimum_balance?
    @balance < MINIMUM_BALANCE
  end

  def clear_entry_station
    @journey[:entry_station] = nil
  end

  def add_station_to_journey_hash(key, station)
    @journey[key.to_sym] = station
  end

  def add_journey_to_journeys_list
    @journeys << @journey
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
