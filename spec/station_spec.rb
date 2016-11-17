require "station"

describe Station do

  describe '#name' do

    it "should store a name" do
      station = create_station(name: "Aldgate")
      expect(station.name).to eq "Aldgate"
    end

  end

  describe '#zone' do

    it "should store a zone" do
      station = create_station(zone: 2)
      expect(station.zone).to be 2
    end

  end

end

#
# Helper Methods
#

def create_station(arguments)
  name = arguments[:name]
  zone = arguments[:zone]
  Station.new(name, zone)
end
