require 'spec_helper'

require_relative '../lib/command'

describe 'Command Pattern' do

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
