class Journey

  attr_reader :current, :fare

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @current = {origin: nil, destination: nil}
  end

  def in_journey?
    @current[:origin] != nil
  end

  def begin(station)
    add_station_to_current_journey(:origin, station)
  end

  def terminate(station)
    add_station_to_current_journey(:destination, station)
  end

  def fare
    return PENALTY_FARE if incomplete_journey?
    zones = [@current[:origin].zone, @current[:destination].zone]
    calculated_fare = zones.max - zones.min
    calculated_fare > MINIMUM_FARE ? calculated_fare : MINIMUM_FARE
  end

  def incomplete_journey?
    @current[:origin] == nil || @current[:destination] == nil
  end

  private

    def add_station_to_current_journey(point, station)
      @current[point] = station
    end

end
