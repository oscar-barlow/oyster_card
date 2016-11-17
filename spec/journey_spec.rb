require 'journey'

describe Journey do

  subject (:journey) {described_class.new}

  describe '#origin' do

    it 'stores origin station' do
      journey = create_journey(origin: "Aldgate")
      expect(journey.origin).to eq "Aldgate"
    end

  end

  describe '#destination' do

    it 'store destination station' do
      journey = create_journey(destination: "Kings Cross")
      expect(journey.destination).to eq "Kings Cross"
    end

  end

end

def create_journey(arguments)
  origin = arguments[:origin]
  destination = arguments[:destination]
  Journey.new(origin,destination)
end
