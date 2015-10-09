require 'spec_helper'

require_relative '../lib/command'

describe 'Command Pattern' do

	describe 'Undo' do
		it 'can be undone' do
			hero  = Hero.new
			wood  = ChopWoodCommand.new(hero)
			heal  = HealCharacterCommand.new(hero)
			money = GetMoneyCommand.new(hero)


		wood.execute
		heal.execute

		expect(hero.wood).to eq(10)
		expect(hero.health).to eq(5)
       		end
	end

  describe 'Reactor' do

    it 'is fixed if commands are executed in the right order' do
      computer = Computer.new
      computer.add(AmplifyShieldCommand.new)
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestCompilerCommand.new)
      computer.add(InstallRegulatorCommand.new)

      reactor = Reactor.new
      expect(reactor.functional?).to be_falsey
      reactor.fix(computer.execute)
      expect(reactor.functional?).to be_truthy
    end
  end

  describe 'Computer' do
    let(:computer) { Computer.new }

      before :each do
        computer.add(CalibrateDriverCommand.new)
        computer.add(TestCompilerCommand.new)
      end

    it 'can add commands to its queue' do
      expect(computer.queue.size).to eq(2)
    end

    it "executes all commands in order" do
      expect(computer.execute).to eq %Q{
Calibrated Driver
Tested Compiler
}
    end
  end

  describe 'Commands' do

    describe 'AmplifyShieldCommand' do
      it 'Amplifies Shield' do
        command = AmplifyShieldCommand.new
        expect(command.execute).to eq("Amplifies Shield")
      end
    end

    describe 'CalibrateDriverCommand' do
      it 'calibrates driver' do
        command = CalibrateDriverCommand.new
        expect(command.execute).to eq("Calibrated Driver")
      end
    end

    describe 'TestCompilerCommand' do
      it 'test compiler' do
        command = TestCompilerCommand.new
        expect(command.execute).to eq("Tested Compiler")
      end
    end

    describe 'InstallRegulatorCommand' do
      it 'install regulator' do
        command = InstallRegulatorCommand.new
        expect(command.execute).to eq("Install Regulator")
      end
    end

  end

end
