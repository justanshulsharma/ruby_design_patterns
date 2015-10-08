require 'spec_helper'

require_relative '../lib/strategy'

describe "Strategy Pattern" do

  let(:hero) { Hero.new }

  it "has damage" do
    expect(hero.damage).to eq(10)
  end

  it "has health" do
    expect(hero.health).to eq(5)
  end

  describe "Printing Character Stats" do
    it "print battle stats by default" do
      expect(hero.print_stats).to eq("Damage: 10\nHealth: 5")
    end
  end

  describe "Skills" do
    it "has stealth" do
      expect(hero.skills).to include(:skills)
    end

    it "has driving" do
      expect(hero.skills).to include(:driving)
    end

    it "has intimidiation" do
      expect(hero.skills).to include(:intimidiation)
    end
  end
end
