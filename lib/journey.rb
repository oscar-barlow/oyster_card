class Journey

  attr_reader :origin, :destination

  def initialize(origin,destination)
    @origin = origin
    @destination = destination
    
  end

  def in_journey?
    @origin
  end



end
