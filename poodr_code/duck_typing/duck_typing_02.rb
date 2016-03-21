class Trip

  attr_reader :bicycles, :customers, :vehicle

  # Trip#prepare doesn't care what preparers are,
  # it's a duck that responds to #prepare_trip
  def prepare(preparers)
    preparers.each { |preparer| preparer.prepare_trip(self) }
  end

end


class Mechanic

  # Mechanic as duck!
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle
    # etc
  end

end


class TripCoordinator

  # TripCoordinator as duck!
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
    # etc
  end

end


class Driver

  def prepare_trip(trip)
    vehicle = trip.vehicle

    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  def gas_up(vehicle)
    # etc
  end

  def fill_water_tank(vehicle)
    # etc
  end

end