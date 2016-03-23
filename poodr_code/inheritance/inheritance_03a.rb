class Bicycle

  # Newly empty.
  # Code that was previously here has been pushed down into RoadBike

end


class MountainBike < Bicycle

  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)                     # this will blow up! There's no Bicycle#initialize
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end

end


class RoadBike < Bicycle

  attr_reader :size, :tape_colour

  def initialize(args)
    @size        = args[:size]
    @tape_colour = args[:tape_colour]
  end

  # Every bike has the same default chain, and tire size
  def spares
    {
      chain:       "10-speed",      # true for all bikes
      tire_size:   "23",            # true for road bikes only
      tape_colour: tape_colour      # true for road bikes only
    }
  end

end


# This works as it should
road_bike = RoadBike.new(size: "M", tape_colour: "red")

road_bike.size
# => "M"
