class Gear

  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  # YOU HAD ONE JOB! And that is to calculate gear inches
  def gear_inches
    ratio * wheel.diameter
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