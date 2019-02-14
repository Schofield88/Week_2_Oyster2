class Journey

  attr_accessor :entry_station, :exit_station

  PENALTY = 6
  FARE = 1

  def initialize(station = nil)
    @entry_station = station
  end

  def exit_station(exit)
    @exit_station = exit
  end

  def fare
    @entry_station == nil || @exit_station == nil ? PENALTY : FARE
  end

end
