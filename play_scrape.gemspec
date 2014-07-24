# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'play_scrape/version'

Gem::Specification.new do |spec|
  spec.name          = "play_scrape"
  spec.version       = PlayScrape::VERSION
  spec.authors       = ["Michael Villena"]
  spec.email         = ["mvillena@cmu.edu"]
  spec.description   = %q{Basic scraping of the Google PlayStore}
  spec.summary       = %q{It can scrape the play store}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "nokogiri", "~> 1.6.0"
  spec.add_runtime_dependency "typhoeus", "~> 0.6.6"
end
