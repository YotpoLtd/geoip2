# Geoip2

Integration with MaxMind GeoIP2 API

## Build Status

[![Build Status](https://travis-ci.org/YotpoLtd/geoip2.png?branch=master)](https://travis-ci.org/YotpoLtd/geoip2)
[![Coverage Status](https://coveralls.io/repos/YotpoLtd/geoip2/badge.png)](https://coveralls.io/r/YotpoLtd/geoip2)
[![Dependency Status](https://gemnasium.com/YotpoLtd/geoip2.png)](https://gemnasium.com/YotpoLtd/geoip2)
[![Code Climate](https://codeclimate.com/github/YotpoLtd/geoip2.png)](https://codeclimate.com/github/YotpoLtd/geoip2)

## Installation

Add this line to your application's Gemfile:

    gem 'geoip2'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install geoip2

## Usage

Configure the Geoip2 by:
```ruby
Geoip2.configure do |conf|
    # Mandatory
    conf.license_key = 'Your MaxMind License Key'
    conf.user_id = 'Your MaxMind User Id'
    
    # Optional
    conf.host = 'geoip.maxmind.com' # Or any host that you would like to work with
    conf.base_path = '/geoip/v2.0' # Or any other version of this API
    conf.parallel_requests = 5 # Or any other amount of parallel requests that you would like to use
end
```

Getting a country from an IP
```ruby
Geoip2.country('0.0.0.0')
```

Getting a country for multiple IPs at the same time
```ruby
Geoip2.in_parallel do
    Geoip2.country('0.0.0.1')
    Geoip2.country('0.0.0.2')
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

