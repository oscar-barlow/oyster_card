require 'journey_log'

describe JourneyLog do
  subject (:journeylog) {described_class.new}
  let (:journey) {double :journey}
   before do
   allow(journey).to receive(:current_journey).and_return({:origin => 'origin station', :destination => 'destination station'})
 end
  it "should be empty when it initializes" do
    expect(subject.trips).to be_empty
  end

  it 'should add a journey to its trips list' do
    journeylog.add(journey.current_journey)
    expect(journeylog.trips).to include journey.current_journey
  end
end
