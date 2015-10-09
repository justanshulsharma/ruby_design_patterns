require 'spec_helper'

require_relative '../lib/command'

describe 'Command Pattern' do

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
