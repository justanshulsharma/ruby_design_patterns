class Hero
  attr_reader :damage, :health, :skills
  attr_accessor :printer

  def initialize(printer)
    @damage  = 10
    @health  = 5
    @printer = printer

    @skills  = [:stealth, :driving, :intimidiation]
  end

  def print_stats
    if block_given?
      yield(damage, health, skills)
    else
      printer.print(damage, health, skills)
    end
  end
end

class HtmlPrinter
  def print(damage, health, skills)
    result = header
    result += content(damage, health, skills)
    result += footer
  end

  def header
    "<html>"
  end

  def footer
    "</html>"
  end

  def content
    raise "You must implement content"
  end
end

class BattleStats < HtmlPrinter
  def content(damage, health, skills)
    "Damage: #{damage}\nHealth: #{health}"
  end
end

class SkillStats < HtmlPrinter
  def content(damage, health, skills)
    skills.inject("") { |result, skill| result + skill.to_s.capitalize + "\n" }
  end
end
