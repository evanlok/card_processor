# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'card_processor/version'

Gem::Specification.new do |spec|
  spec.name          = 'card_processor'
  spec.version       = CardProcessor::VERSION
  spec.authors       = ['Evan Lok']
  spec.email         = ['elok45@gmail.com']

  spec.summary       = %q{Process credit card input}
  spec.homepage      = 'http://github.com/evanlok/card_processor'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'luhn-ruby', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'coveralls'
end
