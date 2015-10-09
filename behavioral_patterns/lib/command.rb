class Hero
  attr_accessor :wood, :health, :money

  def initialize
    @wood, @health, @money = 0, 0, 0
  end
end

class ChopWoodCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.wood += 10
  end
end

class HealCharacterCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.health += 5
  end
end

class GetMoneyCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.money += 10
  end
end

class Reactor
  def initialize
    @functional = false
    @right_command = %Q{
Amplifies Shield
Calibrated Driver
Tested Compiler
Install Regulator
}
  end

  def fix(result)
    @functional = result == @right_command
  end

  def functional?
    @functional
  end
end

class Computer
  attr_reader :queue

  def initialize
    @queue = []
  end

  def add(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |result, command| result + command.execute + "\n" }
  end
end

class AmplifyShieldCommand
  def execute
    "Amplifies Shield"
  end
end

class CalibrateDriverCommand
  def execute
    "Calibrated Driver"
  end
end

class TestCompilerCommand
  def execute
    "Tested Compiler"
  end
end

class InstallRegulatorCommand
  def execute
    "Install Regulator"
  end
end
