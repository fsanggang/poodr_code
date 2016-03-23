class Schedule

  # Based off Fig 7.2
  #
  # Schedule asks each target for their lead_days.
  #
  # Each target implements #lead_days, i.e. a public interface. Bicycle,
  # Mechanic, and Vehicle are ducks!
  #
  # Problem is, why are we asking Schedule if Bicycle is schedulable? We
  # should be asking Bicycle directly!
  def scheduleable?(target, starts, ends)
    !scheduled?(target, starts + target.lead_days, ends)
  end

  # Schedulable is the duck type for Bicycle, Mechanics, and Vehicles
  def scheduled?(scheduleable, starts, ends)
    puts "This #{scheduleable.class} is not scheduled between #{starts} and #{ends}"
  end

  def add(target, starts, ends)
    # etc
  end

  def remove(target, starts, ends)
    # etc
  end

end



class Bicycle

  attr_reader :schedule, :size, :chain, :tire_size

  # Inject a schedule or provide a default
  # Note that this is a dependency between Bicycle and Schedule
  def initialize(args = {})
    @schedule = args[:schedule] || Schedule.new
  end

  # Bicycle knows about its own scheduleability, we can ask it directly
  # whether it is scheduleable or not
  def scheduleable?(starts, ends)
    !scheduled?(starts - lead_days, ends)
  end

  def scheduled?(starts, ends)
    schedule.scheduled?(self, starts, ends)
  end

  def lead_days
    1
  end

end



class Mechanic

  #etc

  def lead_days
    4
  end

end



class Vehicle

  # etc

  def lead_days
    3
  end

end



require "date"

starts = Date.parse("2015/09/04")
ends   = Date.parse("2015/09/10")

bike = Bicycle.new

bike.scheduleable?(starts, ends)

# => "This Bicycle is not scheduled between 2015-09-03 and 2015-09-10"
