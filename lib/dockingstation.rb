require_relative 'bike'

class DockingStation
  attr_reader :bike_storage
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize
    @bike_storage = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    if empty?
      raise 'No bikes available'
    else
      @bike_storage.pop
    end
  end

  def dock(bike)
    if full?
      raise 'Station full'
    else
      @bike_storage << bike
    end
  end

  private
  def full?
    @bike_storage.length >= @capacity
  end

  def empty?
    @bike_storage.empty?
  end

end
# 20.times { docking_station.dock Bike.new }
