# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iglatinpay/version'

Gem::Specification.new do |spec|
  spec.name          = "iglatinpay"
  spec.version       = Iglatinpay::VERSION
  spec.authors       = ["Brandon Hansen"]
  spec.email         = ["bh@jesusculture.com"]
  spec.summary       = %q{For all of the times you must output piglatin}
  spec.description   = %q{Convert any string to its piglatin equivalent}
  spec.homepage      = "https://github.com/ready4god2513/piglatin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
