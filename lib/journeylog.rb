

class JourneyLog
attr_reader :journey_class, :journeys, :exitstation

  def initialize
    @journeys = []
    @journey_class = Journey.new
  end

  def start(station)

    @entry = station
    @journeys << station

  end

  def current_journey
    return journeys.last if journeys.last != nil && journeys.last.exitstation == nil
    @journey_class
  end

  def finish(exitstation)
    @exitstation = exitstation
    @journeys << exitstation
  end
end
