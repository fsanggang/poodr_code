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

  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select { |part| part.needs_spare }
  end

end


class Part

  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name        = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end

end



chain = Part.new(name: "chain", description: "10-speed")

# RoadBike
road_tire_size = Part.new(name: "tire_size", description: "23")
tape_colour = Part.new(name: "tape_colour", description: "red")

road_bike_parts = Parts.new([chain, road_tire_size, tape_colour])

road_bike = Bicycle.new(size: "L", parts: road_bike_parts)

puts "RoadBike"
puts "size: #{road_bike.size}"
puts "spares: #{road_bike.spares.inspect}"

# MountainBike
mountain_tire_size = Part.new(name: "tire_size", description: "2.1")
rear_shock = Part.new(name: "rear_shock", description: "Fox")
front_shock = Part.new(name: "front_shock", description: "Manitou", needs_spare: false)

mountain_bike_parts = Parts.new([chain, mountain_tire_size, rear_shock, front_shock])

mountain_bike = Bicycle.new(size: "M", parts: mountain_bike_parts)

puts "MountainBike"
puts "size: #{mountain_bike.size}"
puts "spares: #{mountain_bike.spares.inspect}"