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

  def local_spares
    { tape_colour: tape_colour }
  end

  def default_tire_size
    "23"
  end

end


class RecumbentBike < Bicycle

  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    { flag: flag }
  end

  def default_tire_size
    "28"
  end

  def default_chain
    "9-speed"
  end

end


# This works as it should
bent = RecumbentBike.new(flag: "tall and orange")

bent.spares
# => { tire_size: "28", chain: "9-speed", flag: "tall and orange" }