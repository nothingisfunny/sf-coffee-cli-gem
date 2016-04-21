# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sf_coffee/version'

Gem::Specification.new do |spec|
  spec.name          = "sf_coffee"
  spec.version       = SfCoffee::VERSION
  spec.authors       = ["nothingisfunny"]
  spec.email         = ["if.the.kids.r.united@gmail.com"]

  spec.summary       = %q{Scraper for popular San Francisco coffee shop locations.}
  spec.description   = %q{Lists information for Starbucks, Peet's, and Philz, including name address, and phone number, allows one to search for nearest locations by ZIP Code.}
  spec.homepage      = "https://github.com/nothingisfunny/sf-coffee-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency 'colorize', '~> 0.7.7'

end
