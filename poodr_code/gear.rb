class Gear

  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
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

  Wheel = Struct.new(:rim, :tire) do
    # YOU HAD ONE JOB! And that is to calculate wheel diameter
    def diameter
      rim + (tire * 2)
    end
  end

end