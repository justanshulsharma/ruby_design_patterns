require 'spec_helper'

require_relative '../lib/strategy'

describe "Strategy Pattern" do

  describe "Strategy Contract" do
    it "Hero Sends Print Message to Printer" do
      printer = double("printer")
      allow(printer).to receive(:print)
      hero = Hero.new printer
      printer.should_receive(:print).with(hero.damage, hero.health, hero.skills)
      hero.print_stats
    end

    it "BattleStats should respond to printer message" do
      expect(BattleStats.new).to respond_to(:print)
    end

    it "SkillStats should respond to printer message" do
      expect(SkillStats.new).to respond_to(:print)
    end
  end

  let(:hero) { Hero.new BattleStats.new }

  it "has damage" do
    expect(hero.damage).to eq(10)
  end

  it "has health" do
    expect(hero.health).to eq(5)
  end

  describe "Printing Character Stats" do
    it "print battle stats by default" do
      expect(hero.print_stats).to eq("<html>Damage: 10\nHealth: 5</html>")
    end

    it "print skills" do
      hero.printer = SkillStats.new
      expect(hero.print_stats).to eq("<html>Stealth\nDriving\nIntimidiation\n</html>")
    end

    it "can use custom ad hoc printer" do
      result = hero.print_stats do |damage, health, skills|
        "Damage: #{damage}\nNumber of skills: #{skills.size}"
      end
      expect(result).to eq("Damage: 10\nNumber of skills: 3")
    end
  end

  describe "Skills" do
    it "has stealth" do
      expect(hero.skills).to include(:stealth)
    end

    it "has driving" do
      expect(hero.skills).to include(:driving)
    end

    it "has intimidiation" do
      expect(hero.skills).to include(:intimidiation)
    end
  end
end
