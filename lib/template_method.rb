class Hero
  attr_reader :damage

  def initialize
    @damage = 10
  end

  def attack
    "Attacked dealing 10 damage."
  end
end
