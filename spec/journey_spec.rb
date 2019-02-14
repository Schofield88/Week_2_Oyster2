require "journey"

describe Journey do

  let (:journey) { Journey.new }

  it "gets an entry station" do
    expect(journey.entry_station).to be nil
  end

  it "gets an exit station" do
    expect(journey.exit_station("Camden")).to eq("Camden")
  end

  it "will return 1 with entry and exit" do
    journey2 = Journey.new("Camden")
    journey2.exit_station("Cannon Street")
    expect(journey2.fare).to eq 1
  end

  it "returns a fare or penalty" do
    expect(journey.fare).to eq 6
  end

end
