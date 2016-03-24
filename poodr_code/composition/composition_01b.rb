class Bicycle

  attr_reader :size, :parts

  def initialize(args = {})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end

end

class Parts

  attr_reader :chain, :tire_size

  def initialize(args = {})
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size

    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def spares
    {
      tire_size: tire_size,
      chain:     chain
    }.merge(local_spares)
  end

  def default_chain
    "10-speed"
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def local_spares
    {}
  end

end


class MountainBikeParts < Parts

  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size
    "2.1"
  end

end


class RoadBikeParts < Parts

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


class RecumbentBikeParts < Parts

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
road_bike = Bicycle.new(size: "L", parts: RoadBikeParts.new(tape_colour: "red"))

road_bike.size
# => "L"

road_bike.spares
# => { tire_size: "23", chain: "10-speed", tape_colour: "red" }


mountain_bike = Bicycle.new(size: "L", parts: MountainBikeParts.new(rear_shock: "Fox"))

mountain_bike.size
# => "L"

mountain_bike.spares
# => { tire_size: "2.1", chain: "10-speed", rear_shock: "Fox" }


