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

  describe '#in_journey?' do

    it 'returns true if the journey is incomplete' do
      journey = create_journey(origin: nil, destination: nil)
      journey.begin("Aldgate")
      expect(journey.in_journey?).to be_truthy
    end

    it 'returns false if the journey is complete' do
      journey = create_journey(origin: nil, destination: nil)
      expect(journey.in_journey?).to be_falsey
    end

  end

  describe '#add_station_to_current_journey_hash' do

    it 'adds the origin station to current journey hash' do
      journey = create_journey(origin: nil, destination: nil)
      journey.begin("Aldgate")
      expect(journey.current_journey[:origin]).to eq "Aldgate"
    end

  end
end

def create_journey(arguments)
  origin = arguments[:origin]
  destination = arguments[:destination]
  Journey.new(origin,destination)
end
