# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geoip2/version'

Gem::Specification.new do |spec|
  spec.name          = 'geoip2'
  spec.version       = Geoip2::VERSION
  spec.authors       = ['Vladislav Shub']
  spec.email         = %w(vlad@yotpo.com)
  spec.description   = %q{Integration with MaxMind GeoIP2 API}
  spec.summary       = %q{Integration with MaxMind GeoIP2 API}
  spec.homepage      = 'https://github.com/YotpoLtd/geoip2'
  spec.license       = 'GPLv2'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'coveralls', '~> 0.7.1'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'simplecov', '~> 0.9.0'
  spec.add_development_dependency 'webmock', '~> 1.18.0'
  spec.add_development_dependency 'vcr', '~> 2.9.2'

  spec.add_dependency 'faraday'
  spec.add_dependency 'typhoeus'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'hashie'
end
