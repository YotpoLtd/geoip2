module Geoip2
  module Api
    module CityIspOrg
      def city_isp_org(ip, faraday_options = {})
        get("/city_isp_org/#{ip}", faraday_options)
      end
    end
  end
end