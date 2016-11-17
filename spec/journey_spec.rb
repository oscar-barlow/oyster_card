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

  describe '#begin' do

    it 'adds the origin station to current journey hash' do
      journey.begin("Aldgate")
      expect(journey.current_journey[:origin]).to eq "Aldgate"
    end

  end

  describe '#terminate' do

    it 'adds the destination station to current journey hash' do
      journey.terminate("Aldgate")
      expect(journey.current_journey[:destination]).to eq "Aldgate"
    end

  end

  describe '#current_journey' do

    it "returns a journey hash when you call current journey after a completed journey" do
      journey.begin("Aldgate")
      journey.terminate("Kings Cross")
      expect(journey.current_journey).to include(origin: "Aldgate", destination: "Kings Cross")
    end
  end

end
