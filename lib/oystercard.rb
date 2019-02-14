require 'journey'

class Oystercard
  attr_accessor :balance
  attr_reader :entry_station
  attr_reader :list_of_journey

  TOPUP_LIMIT = 90
  MIN_BALANCE = 1
  def initialize
    @balance = 0
    @list_of_journey = {}
    @trip = Journey.new
  end

  def top_up(value)
    fail "The maximum balance of #{TOPUP_LIMIT} exceeded" if @balance + value > TOPUP_LIMIT
    @balance += value
  end

  def in_journey?
    if @trip.entry_station == nil
      false
    else
      true
    end
  end

  def entry_station
    @trip.entry_station
  end

  def touch_in(station)
    raise "Not enough balance" if @balance < MIN_BALANCE
    @trip.entry_station = station
    @list_of_journey.merge!(entry: station)
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @trip.exit_station = exit_station
    @trip.entry_station = nil
    @list_of_journey.merge!(exit: exit_station)

  end

private

  def deduct(value)
    @balance -= value
  end

end
