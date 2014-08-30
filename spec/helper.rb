require 'simplecov'
require 'coveralls'
require 'rspec'
require 'webmock/rspec'
require 'geoip2'
require 'vcr'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]
SimpleCov.start
Coveralls.wear!

VCR.configure do |c|
  c.hook_into :webmock
  c.ignore_hosts 'coveralls.io'
  c.cassette_library_dir     = 'spec/cassettes'
  c.default_cassette_options = { :record => :new_episodes }
end