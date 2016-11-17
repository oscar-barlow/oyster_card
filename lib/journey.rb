class Journey

  attr_reader :current_journey, :fare

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @current_journey = {origin: nil, destination: nil}
  end

  def in_journey?
    @current_journey[:origin] != nil
  end

  def begin(station)
    add_station_to_current_journey(:origin, station)
  end

  def terminate(station)
    add_station_to_current_journey(:destination, station)
  end

  def fare
    return PENALTY_FARE if incomplete_journey?
    return MINIMUM_FARE
  end

  def incomplete_journey?
    @current_journey[:origin] == nil || @current_journey[:destination] == nil
  end

  private

    def add_station_to_current_journey(point, station)
      @current_journey[point] = station
    end

end
