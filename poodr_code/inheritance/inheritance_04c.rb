class Bicycle

  attr_reader :size,
              :chain,               # promoted from RoadBike
              :tire_size            # promoted from RoadBike

  def initialize(args)
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size

    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def default_chain                 # common default
    "10-speed"
  end

  # Do this out of kindness to future developers!
  #
  # If they need to add a new bike, this error message will let them know that
  # their new subclass MUST implement #default_tire_size
  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def spares
    {
      tire_size: tire_size,
      chain:     chain
    }.merge(local_spares)
  end

  def local_spares
    {}
  end

end


class MountainBike < Bicycle

  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  # This only works because it 'knows' super to return a Hash
  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size
    "2.1"
  end

end


class RoadBike < Bicycle

  attr_reader :tape_colour

  def post_initialize(args)
    @tape_colour = args[:tape_colour]
  end

  def default_tire_size
    "23"
  end

  def local_spares
    { tape_colour: tape_colour }
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