require 'spec_helper'

module Colorist
  describe Extractor do

    subject { Extractor.new('spec/support/arnolfini.jpg') }

    it "sets the default colors to 8" do
      subject.colors.should == 8
    end

    it "sets the default depth to 16" do
      subject.depth.should == 16
    end

    it "raises an argument error if provided an invalid file" do
      expect {
        Extractor.new('invalid_file.txt')
      }.to raise_error(ArgumentError, "invalid_file.txt does not exist or is not a valid image file")
    end
   
    describe "instance methods" do

      subject { Extractor.new('spec/support/arnolfini.jpg', :colors => 2) }
  
      describe "#process!" do
        it 'gets the colors from the image' do
          subject.process!

          subject.data.should == [ 
            {:freq => 3970743, :red => 62.60, :green => 42.91, :blue => 34.61},
            {:freq => 1649905, :red => 164.22, :green => 111.74, :blue => 89.49}
          ]
        end
      end

      describe "#report" do
        it 'raises an error if called without having processed any file' do
          expect {
            subject.report
          }.to raise_error("Must call #process first!")
        end

        it 'outputs a handy hash with all the information' do
        end
      end
    
    end

    describe "class methods" do
    
      describe "#process" do
        it 'initializes a new instance and calls process' do
          instance = double('extractor')
          Extractor.should_receive(:new).with('file', :colors => 2).and_return instance
          instance.should_receive(:process!)

          Extractor.process('file', :colors => 2)
        end
      end
    
    end

  end
end
