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
      raw_data = `convert #{file} -gravity Center -crop 80x60% +repage -format %c -colors #{colors} -depth #{depth} histogram:info:- | sort -r -k 1`
      @data = Parser.parse(raw_data)
      Reporter.report(@data, @reporter_options)
    end

    class << self
      def process(*args)
        instance = new(*args)
        instance.process!
      end
    end

  end
end
