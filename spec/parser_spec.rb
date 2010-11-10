require 'spec_helper'

module Colorist
  describe Parser do
  
    subject { Parser.new }

    describe "instance methods" do

      let(:raw_data) { "   3970743: (16087,11029, 8895) #3ED72B1522BF rgb(24.5472%,16.8292%,13.5729%)\n   1649905: (42205,28716,22999) #A4DD702C59D7 rgb(64.4007%,43.8178%,35.0942%)\n\n" }

      let(:arnolfini_data) do
        [ 
          {:freq => 70.65, :red => 62.60, :green => 42.91, :blue => 34.61},
          {:freq => 29.35, :red => 164.22, :green => 111.74, :blue => 89.49}
        ]
      end
    
       describe "#parse" do
          it 'gets the colors from the image' do
            subject.parse(raw_data).should == arnolfini_data
          end
       end
    
    end

    describe "class methods" do
    
      describe "#parse" do
        it 'initializes a new instance and calls parse' do
          instance = double('parser')
          data = double('data')

          Parser.should_receive(:new).and_return instance
          instance.should_receive(:parse).with(data)

          Parser.parse(data)
        end
      end
    
    end

  end
end
