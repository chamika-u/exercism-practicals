class Lasagna
  EXPECTED_MINUTES_IN_OVEN = 40;
  MINUTES_PER_LAYER = 2;
  def remaining_minutes_in_oven(actual_minutes_in_oven)
    EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  def preparation_time_in_minutes(layers)
    MINUTES_PER_LAYER*layers
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    return actual_minutes_in_oven + (number_of_layers*MINUTES_PER_LAYER)
  end
end

lasagna = Lasagna.new
lasagna.remaining_minutes_in_oven(30)
lasagna = Lasagna.new
lasagna.preparation_time_in_minutes(2)
lasagna = Lasagna.new
lasagna.total_time_in_minutes(number_of_layers: 3, actual_minutes_in_oven: 20)
