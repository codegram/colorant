module Colorant
  class Parser

    class << self
      def parse(*args)
        new.parse(*args)
      end
    end

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

    private

    def percent_to_number(percent)
      ("%.2f" % (255 * percent)).to_f
    end

    def number_to_percent(number, total)
      ("%.2f" % ((number * 100.to_f) / total)).to_f
    end

  end
end
