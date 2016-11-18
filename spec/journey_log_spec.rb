require 'journey_log'

describe JourneyLog do
  subject (:journeylog) {described_class.new}
  let (:journey) {double :journey}

  before do
    allow(journey).to receive(:current).and_return({:origin => 'origin station', :destination => 'destination station'})
  end

  describe '#log' do

    it "should be have an empty log when it initializes" do
      expect(subject.log).to be_empty
    end

    it 'should add a journey to its log' do
      journeylog.add(journey.current)
      expect(journeylog.log).to include journey.current
    end

  end

  describe 'error handling' do

    it "should fail if you try to add <not a hash> to log" do
      message = "You can only add journey hashes to the log"
      expect{ journeylog.add("foo") }.to raise_error(RuntimeError, message)
    end

  end
end
