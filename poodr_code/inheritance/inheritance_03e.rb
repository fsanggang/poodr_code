class Bicycle

  attr_reader :size,
              :chain,               # promoted from RoadBike
              :tire_size            # promoted from RoadBike

  def initialize(args)
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain                 # common default
    "10-speed"
  end

end


class MountainBike < Bicycle

  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end

  def default_tire_size
    "2.1"
  end

end


class RoadBike < Bicycle

  attr_reader :tape_colour

  def initialize(args)
    @tape_colour = args[:tape_colour]
    super(args)                     # gotta call super to make sure size gets initialized
  end

  # Every bike has the same default chain, and tire size
  def spares
    {
      chain:       "10-speed",      # true for all bikes
      tire_size:   "23",            # true for road bikes only
      tape_colour: tape_colour      # true for road bikes only
    }
  end

  def default_tire_size
    "23"
  end

end


# This works as it should
road_bike = RoadBike.new(size: "M", tape_colour: "red")

road_bike.tire_size
# => "23"

road_bike.chain
# => "10-speed"

mountain_bike = MountainBike.new(size: "S", front_shock: "Manitou", rear_shock: "Fox")

mountain_bike.tire_size
# => "2.1"

mountain_bike.chain
# => "10-speed"