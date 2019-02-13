require "journey.rb"
describe Journey do
  let(:journey){Journey.new}
  let(:station){ double :station }

 it 'shows the start of the journey info' do
  expect(subject.start_station(station)).to equal(station)
 end

 it 'shows where the journey finished' do
   expect(subject.finish_station(station)).to equal(station)
end
end
