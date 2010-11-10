require 'simplecov'
SimpleCov.start do
  add_group "Lib", "lib"
end

require 'aruba'
require 'fileutils'

Before do
  FileUtils.mkdir_p('tmp/aruba') 
  FileUtils.cp_r('spec/support/arnolfini.jpg', 'tmp/aruba/')
end
After do
  FileUtils.rm_rf('tmp/aruba') 
end
