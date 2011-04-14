require 'color_namer'

module Colorant
  class Reporter

    class << self
      def report(*args)
        new.report(*args)
      end
    end

    def report(data, options = {})
      data.map! do |row|
        color = ColorNamer.name_from_rgb(row[:red], row[:green], row[:blue])
        if options[:extended]
          name = color[1].match(color.last) ? color[1] : "#{color[1]} #{color.last}"
          [name, row[:freq]]
        else
          [color.last, row[:freq]]
        end
      end

      freqs = {}
      data.each do |color|
        if freqs[color[0]]
          freqs[color[0]] += color[1]
        else
          freqs[color[0]] = color[1]
        end
      end

      colors = freqs.to_a.sort{|a, b| b[1] <=> a[1]}

      send(:"#{options[:reporter] || :ruby}_report", colors)
    end

    private

    def ruby_report(array)
      array
    end

    def stdout_report(array)
      array.each do |line|
        stdout << "\t#{line.first}\t\t\t\t\t\t-- #{line.last} %\n"
      end
      stdout << "\n"
    end

    def stdout
      $stdout
    end

  end
end
