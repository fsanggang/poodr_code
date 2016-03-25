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


require "forwardable"

class Parts

  extend Forwardable        # for message delegation

  # without this, doing the following will fail, because although Parts
  # may SEEM like an array of Part objects, it actually isn't:
  #
  # mountain_bike.parts.size
  # => NoMethodError: undefined method 'size' for Parts
  def_delegator :@parts, :size

  include Enumerable        # for traversal and searching

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


# MountainBike
chain = Part.new(name: "chain", description: "10-speed")
mountain_tire_size = Part.new(name: "tire_size", description: "2.1")
rear_shock = Part.new(name: "rear_shock", description: "Fox")
front_shock = Part.new(name: "front_shock", description: "Manitou", needs_spare: false)

mountain_bike_parts = Parts.new([chain, mountain_tire_size, rear_shock, front_shock])

mountain_bike = Bicycle.new(size: "M", parts: mountain_bike_parts)

puts "MountainBike"
puts "size: #{mountain_bike.size}"

puts "spares: #{mountain_bike.spares.inspect}"
puts "# spares: #{mountain_bike.spares.size}"

puts "parts: #{mountain_bike.parts.inspect}"
puts "# parts: #{mountain_bike.parts.size}"