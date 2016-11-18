require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :journey, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize(journey_klass, journey_log_klass)
    @balance = 0
    @journey = journey_klass.new
    @journeys = journey_log_klass.new
  end

  def top_up(amount)
    fail "Top up too much. Maximum balance is £90." if makes_card_full?(amount)
    @balance += amount
  end

  def in_journey?
    @journey.in_journey?
  end

  def touch_out(station)
    @journey.terminate(station)
    deduct(@journey.fare)
    add_journey_to_journeys_list
    @journey = Journey.new
  end

  def touch_in(station)
    fail "Pauper" if below_minimum_balance?
    @journey.begin(station)
  end

  def makes_card_full?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def below_minimum_balance?
    @balance < MINIMUM_BALANCE
  end

  def add_journey_to_journeys_list
    @journeys.trips << @journey.current_journey
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
