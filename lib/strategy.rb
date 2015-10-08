class Hero
  attr_reader :damage, :health, :skills

  def initialize
    @damage = 10
    @health = 5
    @skills = [:skills, :driving, :intimidiation]
  end

  def print_stats
    "Damage: #{damage}\nHealth: #{health}"
  end
end
