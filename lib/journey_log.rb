class JourneyLog

  attr_reader :log

  def initialize
    @log = []
  end

  def add(journey)
    fail "You can only add journey hashes to the log" if !journey.is_a? Hash
    @log << journey
  end

end
