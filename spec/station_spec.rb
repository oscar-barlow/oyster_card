require "station"

describe Station do

  subject(:station) {described_class.new}

  describe '#name' do

    it "should respond to name" do
      expect(station).to respond_to :name
    end

    it "should store a name" do
      station_name = "Aldgate East"
      station.name=(station_name)
      expect(station.name).to eq station_name
    end

  end

  describe '#zone' do

    it "should respond to zone" do
      expect(station).to respond_to :zone
    end

    it "should store a zone" do
      zone = 2
      station.zone=(zone)
      expect(station.zone).to be 2
    end

  end

end
