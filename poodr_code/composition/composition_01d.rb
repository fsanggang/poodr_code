# Terse descriptions of the combination of parts required for each type of Bicycle
# :name, :description, :needs_spare (optional)
road_config = [
  ["chain", "10-speed"],
  ["tire_size", "23"],
  ["tape_colour", "red"]
]

mountain_config = [
  ["chain", "10-speed"],
  ["tire_size", "2.1"],
  ["front_shock", "Manitou", false],
  ["rear_shock", "Fox"]
]


# PartsFactory has knowledge of road_config and mountain_config structure
module PartsFactory

  def self.build(config, part_class = Part, parts_class = Parts)
    parts_class.new(
      config.collect |part_config| do
        part_class.new(
          name: part_config[0],
          description: part_config[1],
          needs_spare: part_config.fetch(2, true)
        )
      end
    )
  end

end


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



# RoadBike
road_bike_parts = PartsFactory.new(road_config)
road_bike = Bicycle.new(size: "L", parts: road_bike_parts)

puts "RoadBike"
puts "size: #{road_bike.size}"
puts "spares: #{road_bike.spares.inspect}"

# MountainBike
mountain_bike_parts = PartsFactory.new(mountain_config)
mountain_bike = Bicycle.new(size: "M", parts: mountain_bike_parts)

puts "MountainBike"
puts "size: #{mountain_bike.size}"
puts "spares: #{mountain_bike.spares.inspect}"