require 'colorant/parser'
require 'colorant/reporter'
require 'colorant/processer'

module Colorant
  def self.process(*args)
    raise "You must have `convert` (ImageMagick) installed." unless `which convert` =~ /convert/
    Processer.process(*args)
  end
end
