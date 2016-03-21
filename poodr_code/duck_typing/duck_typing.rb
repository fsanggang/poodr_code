class Trip

  attr_reader :bicycles, :customers, :vehicle

  # the mechanic argument could be of any class,
  # it just needs to be something that responds to #prepare_bicycles
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
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
