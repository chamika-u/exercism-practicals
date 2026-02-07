class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    base_production = @speed * 221

    # 2. Determine the success rate based on speed
    success_rate = if @speed <= 4
                     1.0
                   elsif @speed <= 8
                     0.9
                   elsif @speed == 9
                     0.8
                   else
                     0.77
                   end
    base_production * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end

AssemblyLine.new(6).production_rate_per_hour