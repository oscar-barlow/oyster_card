require "oystercard"

describe Oystercard do
  subject(:travelcard) {described_class.new(Journey, JourneyLog)}
  subject(:empty_travelcard) {described_class.new(Journey, JourneyLog)}

  let(:entry_station) {double :entry_station }
  let(:exit_station) {double :exit_station}

  before(:each) do
    travelcard.top_up(20)
  end

  describe '#balance' do

    it "should respond to balance" do
      expect(travelcard).to respond_to(:balance)
    end

    it "should expect the balance to equal zero for a new card" do
      expect(empty_travelcard.balance).to eq(0)
    end

    it "should expect the balance to increase when card is topped up" do
      expect(travelcard.balance).to eq 20
    end

  end

  describe '#top_up' do

    it "should respond to 'top_up'" do
      expect(travelcard).to respond_to(:top_up)
    end

  end

  describe '#in_journey?' do

    it "should respond to 'in_journey'" do
      expect(travelcard).to respond_to(:in_journey?)
    end

    it "should tell us if we are not in journey" do
      travelcard.touch_out(exit_station)
      expect(travelcard.in_journey?).to be_falsey
    end

    it "should initialize with a in_journey value of false" do
      expect(travelcard.in_journey?).to be_falsey
    end

    it "should set in_journey to true when we touch in" do
      travelcard.touch_in(entry_station)
      expect(travelcard.in_journey?).to be_truthy
    end

  end

  describe 'touching in and out' do

    it "should reduce balance by #{Journey::MINIMUM_FARE} when you touch out" do
      travelcard.touch_in(entry_station)
      expect { travelcard.touch_out(exit_station) }.to change{travelcard.balance}.by(-Journey::MINIMUM_FARE)
    end

  end
  #let's test this when we have finish extractin journey_log class
  # describe '#journeys' do
  #     let (:journey) {double :journey}
  #     let (:journeys) {double :journey_log}
  #     allow(:journeys).to_receive(:trips).and_return(:journey)
  #     it 'shows us a list of completed journeys' do
  #
  #       expect
  #     end
  # end
  describe "error handling" do

    it "should raise an error when a top up takes the balance over 90" do
      message = "Top up too much. Maximum balance is £90."
      expect { travelcard.top_up(Oystercard::MAXIMUM_BALANCE) }.to raise_error(RuntimeError, message)
    end

    it "should raise an error when trying to touch in with not enough balance" do
      message = "Pauper"
      expect { empty_travelcard.touch_in(entry_station) }.to raise_error(RuntimeError, message)
    end

  end

end
