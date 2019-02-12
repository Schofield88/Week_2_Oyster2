class Oystercard
  attr_accessor :balance
  attr_reader :entry_station
  attr_reader :list_of_journey

  TOPUP_LIMIT = 90
  MIN_BALANCE = 1
  def initialize
    @balance = 0
    @entry_station = nil
    @list_of_journey = {}
  end

  def top_up(value)
    fail "The maximum balance of #{TOPUP_LIMIT} exceeded" if @balance + value > TOPUP_LIMIT
    @balance += value
  end

  def in_journey?
    !entry_station
  end

  def touch_in(station)
    raise "Not enough balance" if @balance < MIN_BALANCE
    @entry_station = station
    @list_of_journey.merge!(entry: station)
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @entry_station = nil
    @list_of_journey.merge!(exit: exit_station)

  end

private

  def deduct(value)
    @balance -= value
  end

end
