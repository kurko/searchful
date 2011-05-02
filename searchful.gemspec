# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "searchful/version"

Gem::Specification.new do |s|
  s.name        = "uplift"
  s.version     = Searchful::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alexandre de Oliveira"]
  s.email       = ["chavedomundo@gmail.com"]
  s.homepage    = "http://github.com/kurko/searchful"
  s.summary     = %q{text.}
  s.description = %q{text.}

  s.rubyforge_project = "searchful"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
