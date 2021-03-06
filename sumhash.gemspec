# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sumhash/version"

Gem::Specification.new do |s|
  s.name = "sumhash"
  s.version = Sumhash::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Oleksandr Avoiants", "Andrii Dmytrenko", "Alexey Grachov"]
  s.email = ["shhavel@gmail.com"]
  s.homepage = "https://github.com/shhavel/sumhash"
  s.summary = %q{Summation operation for Hash and OpenStruct}
  s.description = %q{Provides summation operation to Hash and OpenStruct. Works with nested structures.}
  s.rubyforge_project = "sumhash"
  s.files = [
    "sumhash.gemspec",
    "lib/sumhash.rb",
    "lib/sumhash/hash.rb",
    "lib/sumhash/ostruct.rb",
    "lib/sumhash/version.rb",
    "test/test_division.rb",
    "test/test_multiplication.rb",
    "test/test_plus.rb",
    "test/test_unary_minus.rb",
  ]
  s.test_files = [
    "test/test_division.rb",
    "test/test_multiplication.rb",
    "test/test_plus.rb",
    "test/test_unary_minus.rb",
  ]
  s.require_paths = ["lib"]
end
