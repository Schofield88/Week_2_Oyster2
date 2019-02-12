require 'oystercard.rb'
describe Oystercard do
  let(:station){ double :station }
  let(:exit_station){double :exit_station}
  let(:list_of_journey){ {entry: station, exit: exit_station} }
  it 'gets created with a default balance of 0' do
    expect(subject.balance).to equal 0
  end

  it 'tops-up the balance' do
     expect(subject.top_up(10)).to equal 10
  end

  it 'throws error if balance is topped up to more than £90' do
    expect {subject.top_up(100)}.to raise_error "The maximum balance of #{Oystercard::TOPUP_LIMIT} exceeded"
  end

  it 'indicates if it is in a journey' do
    expect(subject.in_journey?).to equal true
  end

  it 'allows user to touch in' do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.in_journey?).to equal false
  end

  it 'allows user to touch out' do
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to equal true
  end

  it 'raise error if it doesnt have minimum balance' do
    expect{ subject.touch_in(station) }.to raise_error "Not enough balance"
  end

  it 'should deduct money when touch out' do
    expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-1)
  end

  it 'should record the entry station when touch in' do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.entry_station).to equal(station)
  end

  it 'should expect touch out to forget the entry station' do
    subject.touch_out(exit_station)
    expect(subject.entry_station).to equal nil
  end

  it 'saving the journey history' do
     subject.top_up(10)
     subject.touch_in(station)
     subject.touch_out(exit_station)
     expect(subject.list_of_journey).to include list_of_journey
  end


end
