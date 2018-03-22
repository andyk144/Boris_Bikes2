require_relative 'bike'

class DockingStation
  attr_reader :bike_storage
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(num_of_bikes = nil, initial_capacity = DEFAULT_CAPACITY)
    @capacity = initial_capacity
    @bike_storage = []

    if num_of_bikes.nil?
      DEFAULT_CAPACITY.times { @bike_storage << Bike.new }
    else
      num_of_bikes.times { @bike_storage << Bike.new }
    end

  end

  def release_bike
    if empty? || !@bike_storage.any? {|bike| bike.working?}
      raise 'No bikes available'
    else
      @bike_storage.delete_at(@bike_storage.index {|bike| bike.working? })  
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
