class Bicycle

  attr_reader :style, :size, :tape_colour, :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_colour = args[:tape_colour]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  # Yuck!
  #
  # 1. We have to check for style... indicates possible duck type?
  # 2. If we want to add another type of bike, we"re gonna have to add an elsif
  # 3. Default chain value is duplicated
  def spares
    if style == :road           # road bike
      {
        chain:        "10-speed",
        tire_size:    "23",     # milimeters
        tape_colour:  tape_colour
      }
    else                        # mountain bike
      {
        chain:        "10-speed",
        tire_size:    "2.1",    # inches
        rear_shock:   rear_shock
      }
    end
  end

end


# This 'works' as it should
bike = Bicycle.new(style: :mountain, size: "S", front_shock: "Manitou", rear_shock: "Fox")
 
bike.spares
# => { tire_size: "2.1", chain: "10-speed", rear_shock: "Fox"}