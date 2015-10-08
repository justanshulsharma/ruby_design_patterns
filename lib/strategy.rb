class Hero
  attr_reader :damage, :health, :skills
  attr_accessor :printer

  def initialize(printer)
    @damage  = 10
    @health  = 5
    @printer = printer

    @skills  = [:stealth, :driving, :intimidiation]
  end

  def print_stats(stats = nil)
    printer.print(damage, health, skills)
  end
end


class BattleStats
  def print(damage, health, skills)
    "Damage: #{damage}\nHealth: #{health}"
  end
end

class SkillStats
  def print(damage, health, skills)
    skills.inject("") { |result, skill| result + skill.to_s.capitalize + "\n" }
  end
end
