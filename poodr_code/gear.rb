class Gear

  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def ratio
    chainring / cog.to_f
  end

  # YOU HAD ONE JOB! And that is to calculate gear inches
  def gear_inches
    ratio * diameter
  end

  # YOU HAD ONE JOB! And that is to calculate wheel diameter
  def diameter
    rim + (tire * 2)
  end

end