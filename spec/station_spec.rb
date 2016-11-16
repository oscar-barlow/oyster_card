require "station"

describe Station do

  subject(:station) {described_class.new}

  it "should respond to name" do
    expect(station).to respond_to :name
  end

end
