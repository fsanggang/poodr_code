module Schedulable

  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(starts, ends)
    !scheduled?(starts - lead_days, ends)
  end

  def scheduled?(starts, ends)
    schedule.scheduled?(self, starts, ends)
  end

  # For includers to override as necessary
  def lead_days
    0
  end

end


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
  def schedulable?(target, starts, ends)
    !scheduled?(target, starts + target.lead_days, ends)
  end

  # Schedulable is the duck type for Bicycle, Mechanics, and Vehicles
  def scheduled?(schedulable, starts, ends)
    puts "This #{schedulable.class} is not scheduled between #{starts} and #{ends}"
  end

  def add(target, starts, ends)
    # etc
  end

  def remove(target, starts, ends)
    # etc
  end

end


class Bicycle

  # The dependency on Schedule has been removed, we just need to include the
  # Schedulable module
  include Schedulable

  # etc

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

bike.schedulable?(starts, ends)

# => "This Bicycle is not scheduled between 2015-09-03 and 2015-09-10"
