class Trip

  attr_reader :bicycles, :customers, :vehicle

  # Yuck!
  #
  # Trip#prepare know THREE! classes by name,
  # AND which methods to call on each preparer,
  # AND which arguments to pass those methods
  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      else
      end
    end
  end

end


class Mechanic

  def prepare_bicycles
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle
    # etc
  end

end


class TripCoordinator

  def buy_food(customers)
  end

end


class Driver

  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end

end