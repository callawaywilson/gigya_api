# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gigya_api/version'

Gem::Specification.new do |spec|
  spec.name          = "gigya_api"
  spec.version       = GigyaApi::VERSION
  spec.authors       = ["Adam Wilson"]
  spec.email         = ["adam@callawaywilson.com"]
  spec.description   = %q{A client for the Gigya REST API}
  spec.summary       = %q{Gigya REST API Client}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "rake"
end