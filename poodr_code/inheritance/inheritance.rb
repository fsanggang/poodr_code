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


# This works as it should
bike = Bicycle.new(size: "M", tape_color: "red")
 
bike.size
# => "M"

bike.spares
# => { tire_size: "23", chain: "10-speed", tape_color: "red" }
