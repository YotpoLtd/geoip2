require 'simplecov'
require 'coveralls'
require 'rspec'
require 'webmock/rspec'
require 'geoip2'
require 'vcr'



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

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Geoip2.configure do |conf|
      conf.license_key = ENV['LICENSE_KEY']
      conf.user_id = ENV['USER_ID']
    end
  end
end