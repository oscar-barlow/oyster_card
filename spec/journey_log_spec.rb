require 'journey_log'

describe JourneyLog do
  subject (:journeylog) {described_class.new}
  let (:journey) {double :journey}

  before do
    allow(journey).to receive(:current_journey).and_return({:origin => 'origin station', :destination => 'destination station'})
  end

  describe '#trips' do

    it "should be have an empty trips list when it initializes" do
      expect(subject.trips).to be_empty
    end

    it 'should add a journey to its trips list' do
      journeylog.add(journey.current_journey)
      expect(journeylog.trips).to include journey.current_journey
    end

  end

  describe '#current_journey' do

    it 'should initialize with an empty current journey hash' do
      expect(subject.current_journey).to be_empty
    end

  end

  describe 'error handling' do

    it "should fail if you try to add <not a hash> to trips" do
      message = "You can only add journey hashes to the trips list"
      expect{ journeylog.add("foo") }.to raise_error(RuntimeError, message)
    end

  end
end
