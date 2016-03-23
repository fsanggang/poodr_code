class Schedule

  # Based off Fig 7.1
  #
  # Target is an instance of Bicycle, Vehicle, or Mechanic
  #
  # Schedule knows too much about the target! Knowledge of how many lead days
  # for each target should remain in each target's class
  def scheduleable?(target, starts, ends)
    lead_days = case target.class
                when Bicycle
                  1
                when Mechanic
                  4
                when Vehicle
                  3
                else
                  raise "Unknown target type"
                end

    !scheduled?(target, starts + lead_days, ends)
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


# Pseudo-code
# bike = Bicycle.new

# schedule = Schedule.new
# schedule.scheduleable(bike, today, tomorrow)