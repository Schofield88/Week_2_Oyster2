require 'station.rb'
describe Station do

subject(:station) {described_class.new(name: "Old Street", zone: 1)}

it 'name of the station' do
  expect(station.name).to eq("Old Street")
end

it 'zone of the station' do
  expect(station.zone).to eq(1)
end

end
