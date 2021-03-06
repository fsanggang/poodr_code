class Gear

  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args) # merge in defaults only if keys not in hash

    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # a few lines of scary math
    foo = some_intermediate_result * diameter
    # a few lines of scary math
  end

  def diameter
    wheel.diameter
  end

  def defaults
    { chainring: 40, cog: 18 }
  end

end

class Wheel

  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  # YOU HAD ONE JOB! And that is to calculate wheel diameter
  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

end