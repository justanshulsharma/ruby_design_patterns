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
