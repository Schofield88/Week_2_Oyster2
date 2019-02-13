require "journey.rb"
class Oystercard
  attr_accessor :balance
  attr_reader :list_of_journey

  TOPUP_LIMIT = 90
  MIN_BALANCE = 1
  def initialize
    @balance = 0
    @list_of_journey = {}
    journey = Journey.new
  end

  def top_up(value)
    fail "The maximum balance of #{TOPUP_LIMIT} exceeded" if @balance + value > TOPUP_LIMIT
    @balance += value
  end

  def touch_in(station)
    raise "Not enough balance" if @balance < MIN_BALANCE
    journey.start_station(station)
    @list_of_journey.merge!(entry: station)
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    journey.finish_station(exit_station)
    @list_of_journey.merge!(exit: exit_station)

  end

private

  def deduct(value)
    @balance -= value
  end

end
