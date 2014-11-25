module Geoip2
  module Api
    module City
      def city(ip, faraday_options = {})
        get("/city/#{ip}", faraday_options)
      end
    end
  end
end