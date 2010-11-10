require 'colorist/parser'
require 'colorist/reporter'
require 'colorist/processer'

module Colorist
  def process(*args)
    Processor.process(*args)
  end
end
