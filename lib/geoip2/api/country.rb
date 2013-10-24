module Geoip2
  module Api
    module Country
      def country(ip)
        get("/country/#{ip}")
      end
    end
  end
end