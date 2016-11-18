class JourneyLog

  attr_reader :trips

  def initialize
    @trips = []
  end

  def add(journey)
    @trips << journey
    end
end
