require 'spec_helper'

module Colorant
  describe Processer do

    subject { Processer.new('spec/support/arnolfini.jpg') }

    it "sets the default colors to 8" do
      subject.colors.should == 8
    end

    it "sets the default depth to 16" do
      subject.depth.should == 16
    end

    it "raises an argument error if provided an invalid file" do
      expect {
        Processer.new('invalid_file.txt')
      }.to raise_error(ArgumentError, "invalid_file.txt does not exist or is not a valid image file")
    end
   
    describe "instance methods" do

      subject { Processer.new('spec/support/arnolfini.jpg', :colors => 2) }

      let(:arnolfini_data) do
        [ 
          {:freq => 70.65, :red => 62.60, :green => 42.91, :blue => 34.61},
          {:freq => 29.35, :red => 164.22, :green => 111.74, :blue => 89.49}
        ]
      end

      describe "#process!" do
        it 'calls first the Parser and then the Reporter' do
          Parser.should_receive(:parse).and_return arnolfini_data
          Reporter.should_receive(:report).with(arnolfini_data, :reporter => nil, :extended => nil).ordered
          subject.process!
        end
      end


    end

    describe "class methods" do
    
      describe "#process" do
        it 'initializes a new instance and calls process' do
          instance = double('processer')
          Processer.should_receive(:new).with('file', :colors => 2).and_return instance
          instance.should_receive(:process!)

          Processer.process('file', :colors => 2)
        end
      end
    
    end

  end
end
