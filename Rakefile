require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('leankitkanban', '0.1.2') do |p|
  p.description              = "Ruby Wrapper around LeanKitKanban Api"
  p.url                      = "http://github.com/mlainez/leankitkanban"
  p.author                   = "Marc Lainez"
  p.email                    = "ml@theotherguys.be"
  p.ignore_pattern           = ["tmp/*", "script/*"]
  p.runtime_dependencies     = ['json >=1.6.1', 'httparty =0.8.1']
  p.development_dependencies = ['echoe =4.6.3', 'rspec =2.7.0']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }