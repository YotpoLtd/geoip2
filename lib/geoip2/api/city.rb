module Geoip2
  module Api
    module City
      def city(ip)
        get("/city/#{ip}")
      end
    end
  end
end