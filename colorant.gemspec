# -*- encoding: utf-8 -*-
require File.expand_path("../lib/colorant/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "colorant"
  s.version     = Colorant::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Josep M. Bach', 'Josep Jaume Rey', 'Oriol Gual']
  s.email       = ['info@codegram.com']
  s.homepage    = "http://github.com/codegram/colorant"
  s.summary     = "Easily extract the colors of any image file!"
  s.description = "Easily extract the colors of any image file!"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "colorant"

  s.add_development_dependency "bundler", ">= 1.0.3"
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'

  s.add_runtime_dependency 'trollop'
  s.add_runtime_dependency "color_namer"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
