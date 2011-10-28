require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('leankitkanban', '0.0.3') do |p|
  p.description     = "Ruby Wrapper around LeanKitKanban Api"
  p.url             = "http://github.com/mlainez/leankitkanban"
  p.author          = "Marc Lainez"
  p.email           = "ml@theotherguys.be"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }