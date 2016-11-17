class Journey

  attr_reader :origin, :destination, :current_journey

  def initialize(origin,destination)
    @origin = origin
    @destination = destination
    @current_journey = {}

  end

  def in_journey?
    self.current_journey[:origin] != nil
  end

  def begin(station)
    add_station_to_current_journey("origin",station)
  end

  private

  def add_station_to_current_journey(point,station)
    self.current_journey[point.to_sym] = station
  end


end
