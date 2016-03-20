# We don't get to control this!
module ExternalFramework

  class Gear

    attr_reader :chainring, :cog, :wheel

    # Boo! It depends on fixed-order arguments
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog
      @wheel     = wheel
    end

  end

end


# We can implement our wrapper method! This allows us to:
#
# 1. Create an internal interface, one that we have control over
# 2. Isolate all knowledge of the external interface in one place
module GearWrapper

  def self.gear(args)
    ExternalFramework::Gear.new(args[:chainring], args[:cog], args[:wheel])
  end

end




# Get #gear_inches like dis:
GearWrapper.gear(
  chainring: 52,
  cog:       11,
  wheel:     Wheel.new(26, 1.5)
).gear_inches