require 'spec_helper'

require_relative '../lib/observer_pattern'

describe "Observer Pattern" do

  describe Hero do
    it "is cursed when discover cursed tile" do
      hero = Hero.new
      tile = Tile.new cursed: true

      hero.discover(tile)

      expect(hero.cursed?).to be_truthy
    end

    it "is not cursed when discover simple Tile without cursed" do
      hero = Hero.new
      tile = Tile.new cursed: false

      hero.discover(tile)

      expect(hero.cursed?).to be_falsey
    end
  end

  describe Tile do
    it "is not cursed by default" do
      tile = Tile.new
      expect(tile.cursed?).to be_falsey
    end

    it "can be created as cursed" do
      tile = Tile.new cursed: true
      expect(tile.cursed?).to be_truthy
    end
  end

end
