require 'colorist/parser'
require 'colorist/reporter'
require 'colorist/processer'

module Colorist
  def self.process(*args)
    raise "You must have `convert` (ImageMagick) installed." unless `which convert` =~ /convert/
    Processer.process(*args)
  end
end
