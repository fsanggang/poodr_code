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

  def scheduled?(target, starts, ends)
    # etc
  end

  def add(target, starts, ends)
    # etc
  end

  def remove(target, starts, ends)
    # etc
  end

end



class Bicycle

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

