require "oystercard"

describe Oystercard do

subject(:travelcard) {described_class.new}

it "should respond to balance" do
  expect(subject).to respond_to(:balance)
end

it "should expect the balance to equal zero for a new card" do
  expect(subject.balance).to eq(0)
end

it "should respond to 'top_up'" do
  expect(subject).to respond_to(:top_up)
end

it "should expect the balance to increase when card is topped up" do
  subject.top_up(10)
  expect(subject.balance).to eq 10
end

it "should raise an error when a top up takes the balance over 90" do
  message = "Top up too much. Maximum balance is £90."
  subject.top_up(Oystercard::MAXIMUM_BALANCE)
  expect { subject.top_up(1) }.to raise_error(RuntimeError, message)
end

it "should respond to 'fare'" do
  expect(subject).to respond_to(:deduct)
end

it "should expect the balance to decrease when a fare is charged" do
  subject.top_up(20)
  subject.deduct(5)
  expect(subject.balance).to eq 15
end

it "should respond to 'in_journey'" do
  expect(subject).to respond_to(:in_journey?)
end

it "should tell us if we are not in journey" do
  travelcard.touch_out
  expect(travelcard.in_journey?).to be_falsey
end

 it "should initialize with a in_journey value of false" do
   expect(travelcard.in_journey?).to be_falsey
 end

 it "should set in_journey to true when we touch in" do
   travelcard.touch_in
   expect(travelcard.in_journey?).to be_truthy
 end

end
