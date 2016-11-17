require 'journey'

describe Journey do

  subject (:journey) {described_class.new}

  describe '#in_journey?' do

    it 'returns true if the journey is incomplete' do
      journey.begin("Aldgate")
      expect(journey.in_journey?).to be_truthy
    end

    it 'returns false if the journey is complete' do
      expect(journey.in_journey?).to be_falsey
    end

  end

  describe '#add_station_to_current_journey_hash' do

    it 'adds the origin station to current journey hash' do
      journey.begin("Aldgate")
      expect(journey.current_journey[:origin]).to eq "Aldgate"
    end

    it 'adds the destination station to current journey hash' do
      journey.terminate("Aldgate")
      expect(journey.current_journey[:destination]).to eq "Aldgate"
    end

  end

end
