class Journey

  attr_reader :current_journey,

  def initialize
    @current_journey = {:origin, :destination}
  end

  def in_journey?
    @current_journey[:origin] != nil
  end

  def begin(station)
    add_station_to_current_journey(:origin ,station)
  end

  def terminate(station)
    add_station_to_current_journey("destination",station)
  end

  def add_station_to_current_journey(point,station)
    @current_journey[point] = station
  end

end
