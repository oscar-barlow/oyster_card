require 'journey_log'

describe JourneyLog do
  subject (:journeylog) {described_class.new}

  it "should be empty when it initializes" do
    expect(subject.trips).to be_empty
  end

end
