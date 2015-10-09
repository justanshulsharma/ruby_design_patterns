require 'spec_helper'
require_relative '../lib/factory'

describe 'Factory Pattern' do

  let(:party) { Party.new(HeroFactory.new) }

  it 'has party of warriors' do
    party.add_warriors(3)
    expect(party.members.count { |member| member.class == Warrior}).to eq(3)
  end

  it 'has party of mages' do
    party.add_mages(3)
    expect(party.members.count { |member| member.class == Mage}).to eq(3)
  end

  it 'mixed party' do
    party.add_mages(2)
    party.add_warriors(1)
    expect(party.members.count { |member| member.class == Mage}).to eq(2)
    expect(party.members.count { |member| member.class == Warrior}).to eq(1)
    expect(party.members.count).to eq(3)
  end
end
