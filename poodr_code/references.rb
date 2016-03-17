class ObscuringReferences

  attr_reader :data

  def initialize(data)
    @data = data
  end

  # Expects a 2D array of rim and tire sizes, so if the
  # structure of @data ever changes, we are screwed!
  def diameters
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end

end

class RevealingReferences

  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # Don't give a toss what structure @data is in
  # Just gimme an enumerable that responds to .rim and .tire
  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  Wheel = Struct.new(:rim, :tire)

  # Cares about structure of @data...
  # If the structure ever changes, update here only
  def wheelify
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end

end