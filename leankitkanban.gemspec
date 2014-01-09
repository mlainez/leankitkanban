# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'leankitkanban'
  s.version     = '0.1.4'
  s.date        = '2013-06-11'
  s.summary     = "leankitkanban-#{s.version}"
  s.description = 'Ruby Wrapper around LeanKitKanban Api'
  s.authors     = ['Marc Lainez']
  s.email       = 'ml@theotherguys.be'
  s.homepage    = 'http://github.com/mlainez/leankitkanban'

  s.files         = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ || path =~ /file$/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rake', '~> 10.1.1')
  s.add_development_dependency('rspec', '~> 2.14.1')
  s.add_runtime_dependency('json', '~> 1.8.1')
  s.add_runtime_dependency('httparty', '~> 0.12.0')
end
