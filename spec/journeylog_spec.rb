require 'journeylog'

describe JourneyLog do
  it "is a class" do

  end

  it "initializes with Journey class" do
    journeylog = JourneyLog.new
    expect(journeylog.journey_class).not_to be nil
  end

  it "stores the entry journey" do
    journeylog = JourneyLog.new
    journeylog.start("aldgate")
    expect(journeylog.journeys).to include("aldgate")
  end

  it "stores the whole journey"
  journeylog = JourneyLog.new
  journeylog.start("paddington")
  expect(journeylog.current_journey).to eq ("paddington")
end
