# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "leankitkanban"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marc Lainez"]
  s.date = "2014-04-13"
  s.description = "Ruby Wrapper around LeanKitKanban Api"
  s.email = "ml@theotherguys.be"
  s.extra_rdoc_files = ["LICENSE", "README.md", "lib/leankit_request.rb", "lib/leankitkanban.rb", "lib/leankitkanban/archive.rb", "lib/leankitkanban/backlog.rb", "lib/leankitkanban/board.rb", "lib/leankitkanban/card.rb", "lib/leankitkanban/config.rb", "lib/leankitkanban/version.rb"]
  s.files = ["Gemfile", "Gemfile.lock", "LICENSE", "Manifest", "README.md", "Rakefile", "lib/leankit_request.rb", "lib/leankitkanban.rb", "lib/leankitkanban/archive.rb", "lib/leankitkanban/backlog.rb", "lib/leankitkanban/board.rb", "lib/leankitkanban/card.rb", "lib/leankitkanban/config.rb", "lib/leankitkanban/version.rb", "spec/leankitkanban/archive_spec.rb", "spec/leankitkanban/backlog_spec.rb", "spec/leankitkanban/board_spec.rb", "spec/leankitkanban/card_spec.rb", "spec/leankitkanban/config_spec.rb", "spec/spec_helper.rb", "spec/support/config_helper.rb", "leankitkanban.gemspec"]
  s.homepage = "http://github.com/mlainez/leankitkanban"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Leankitkanban", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "leankitkanban"
  s.rubygems_version = "2.0.14"
  s.summary = "Ruby Wrapper around LeanKitKanban Api"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.6.1"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.8.1"])
      s.add_development_dependency(%q<echoe>, ["= 4.6.3"])
      s.add_development_dependency(%q<rspec>, ["= 2.7.0"])
    else
      s.add_dependency(%q<json>, [">= 1.6.1"])
      s.add_dependency(%q<httparty>, ["= 0.8.1"])
      s.add_dependency(%q<echoe>, ["= 4.6.3"])
      s.add_dependency(%q<rspec>, ["= 2.7.0"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.6.1"])
    s.add_dependency(%q<httparty>, ["= 0.8.1"])
    s.add_dependency(%q<echoe>, ["= 4.6.3"])
    s.add_dependency(%q<rspec>, ["= 2.7.0"])
  end
end
