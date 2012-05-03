# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sumhash/version"

Gem::Specification.new do |s|
  s.name = "sumhash"
  s.version = Sumhash::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Alex Avoyants"]
  s.email = ["shhavel@gmail.com"]
  s.homepage = "https://github.com/shhavel/sumhash"
  s.summary = %q{Sum operations for Hash & OpenStruct classes}
  s.description = %q{This gem provides summing operations to Hashes and OpenStructs. Works with nested structures. If you need a feature added, send me a message on Github!}

  s.rubyforge_project = "sumhash"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
