module Geoip2
  module Api
    module Country
      def country(ip, faraday_options = {})
        get("/country/#{ip}", {}, faraday_options)
      end
    end
  end
end