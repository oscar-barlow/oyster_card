class JourneyLog

  attr_reader :trips, :current_journey

  def initialize
    @trips = []
    @current_journey = {}
  end

  def add(journey)
    fail "You can only add journey hashes to the trips list" if !journey.is_a? Hash
    @trips << journey
  end

end
