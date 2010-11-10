module Colorant
  class Processer
    attr_reader :colors, :depth, :file, :data

    def initialize(file, options = {})
      begin
        File.open(file)
      rescue=>e
        raise ArgumentError.new "#{file} does not exist or is not a valid image file"
      end
      @file = file
      @colors = options[:colors] ? options[:colors].to_i : 8
      @depth = options[:depth] ? options[:depth].to_i : 16
      @reporter_options = {:reporter => options[:reporter],
                           :extended => options[:extended]}
      @data = []
    end

    def process!
      raw_data = `convert #{file} -format %c -colors #{colors} -depth #{depth} histogram:info:- | sort -r -k 1`
      @data = Parser.parse(raw_data)
      Reporter.report(@data, @reporter_options)
    end

    class << self
      def process(*args)
        instance = new(*args)
        instance.process!
      end
    end

    private

    def parse(raw_data)
      collection = []
      raw_data.split("\n").map(&:strip).each do |line|
        line.match /^(\d+):.*rgb\((.*)%,(.*)%,(.*)%\)$/
        freq = $1.to_i
        red, green, blue = [$2,$3,$4].map do |color|
          color.to_f  / 100.to_f
        end
        collection << { :freq => freq,
                        :red => percent_to_number(red),
                        :green => percent_to_number(green),
                        :blue => percent_to_number(blue) }
      end
      total = collection.map{|element| element[:freq]}.inject(:+)
      collection.each{|element| element[:freq] = number_to_percent(element[:freq], total)}
      collection
    end

    def percent_to_number(percent)
      ("%.2f" % (255 * percent)).to_f
    end

    def number_to_percent(number, total)
      ("%.2f" % ((number * 100.to_f) / total)).to_f
    end

  end
end
