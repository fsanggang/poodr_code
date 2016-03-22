class Bicycle

  attr_reader :size, :tape_colour

  def initialize(args)
    @size        = args[:size]
    @tape_colour = args[:tape_colour]
  end

  # Every bike has the same default chain, and tire size
  def spares
    {
      chain:       "10-speed",
      tire_size:   "23",
      tape_colour: tape_colour
    }
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

end

# This doesn't work at all.
mountain_bike = MountainBike.new(size: "S", front_shock: "Manitou", rear_shock: "Fox")

mountain_bike.size
# => "S"

mountain_bike.spares
# => {
#       chain: "10-speed"
#       tire_size: "23"           # wrong!
#       tape_colour: nil          # irrelevant!
#       front_shock: "Manitou"
#       rear_shock: "Fox"
#    }