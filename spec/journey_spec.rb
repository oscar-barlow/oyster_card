require 'journey'

describe Journey do

  subject (:journey) {described_class.new}
  let (:kings_cross) {double(:name => "Kings Cross", :zone => 1)}
  let (:euston) {double(:name => "Euston", :zone => 1)}
  let (:tooting) {double(:name => "Tooting", :zone => 5)}

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
      expect(journey.current[:origin]).to eq "Aldgate"
    end

  end

  describe '#terminate' do

    it 'adds the destination station to current journey hash' do
      journey.terminate("Aldgate")
      expect(journey.current[:destination]).to eq "Aldgate"
    end

  end

  describe '#current' do

    it "returns a journey hash when you call current journey after a completed journey" do
      journey.begin("Aldgate")
      journey.terminate("Kings Cross")
      expect(journey.current).to include(origin: "Aldgate", destination: "Kings Cross")
    end
  end

  describe '#fare' do

    it "responds to .fare" do
      expect(journey).to respond_to :fare
    end

    it "should return the minimum fare, if that's more than the calculated fare" do
      journey.begin(euston)
      journey.terminate(kings_cross)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it "should return a calculated fare based on station zones if that's > minimum fare" do
      journey.begin(euston)
      journey.terminate(tooting)
      expect(journey.fare).to eq 4
    end

    it "should return a penalty fare if you terminate without an exit station" do
      journey.begin(tooting)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "should return a penalty fare if you terminate without an entry station" do
      journey.terminate(kings_cross)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end

end
