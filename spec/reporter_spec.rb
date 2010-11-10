require 'spec_helper'

module Colorant
  describe Reporter do

    describe "class methods" do
    
      describe "#report" do
        it 'initializes a new instance and calls report' do
          instance = double('reporter')
          Reporter.should_receive(:new).and_return instance
          instance.should_receive(:report).with('data')

          Reporter.report('data')
        end
      end
    
    end

    describe "instance methods" do

      let(:arnolfini_data) do
        [ 
          {:freq => 70.65, :red => 62.60, :green => 42.91, :blue => 34.61},
          {:freq => 29.35, :red => 164.22, :green => 111.74, :blue => 89.49}
        ]
      end

      subject { Reporter.new }

      describe "#report" do

        it 'outputs a simple ordered array with the image color composition' do
          subject.report(arnolfini_data).should == [["Brown", 70.65],
                                                    ["Brown", 29.35]]
        end

        context "when called with :extended => true" do

          it 'outputs more accurate info about the color' do
            subject.report(arnolfini_data, :extended => true).should == [["Bistre Brown", 70.65],
                                                         ["Au Chico Brown", 29.35]]
          end

          it 'removes duplication to keep the color name nice' do
            ColorNamer.should_receive(:name_from_rgb).and_return(["594537", "Brown Derby", "Brown"],
                                                                 ["FFFF00", "Yellow", "Yellow"])

            subject.report(arnolfini_data, :extended => true).should == [["Brown Derby", 70.65],
                                                                         ["Yellow", 29.35]]
          end
        end

        context "with :stdout reporter (default from CLI)" do

          before do
            @out = StringIO.new
            subject.stub(:stdout).and_return @out
          end

          it 'outputs a simple ordered array with the image color composition' do
            subject.report(arnolfini_data, :reporter => :stdout)
            @out.string.should include "\tBrown\t\t-- 70.65 %\n"
            @out.string.should include "\tBrown\t\t-- 29.35 %\n"
          end

          context "when called with :extended => true" do

            it 'outputs more accurate info about the color' do
              subject.report(arnolfini_data, :extended => true, :reporter => :stdout)
              @out.string.should include "\tBistre Brown\t\t-- 70.65 %\n"
              @out.string.should include "\tAu Chico Brown\t\t-- 29.35 %\n"
            end

            it 'removes duplication to keep the color name nice' do
              ColorNamer.should_receive(:name_from_rgb).and_return(["594537", "Brown Derby", "Brown"],
                                                                   ["FFFF00", "Yellow", "Yellow"])

              subject.report(arnolfini_data, :extended => true, :reporter => :stdout)
              @out.string.should include "\tBrown Derby\t\t-- 70.65 %\n"
              @out.string.should include "\tYellow\t\t-- 29.35 %\n"
            end
          end

        end

      end
    
    end

  end
end
