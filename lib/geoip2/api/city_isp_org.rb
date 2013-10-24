module Geoip2
  module Api
    module CityIspOrg
      def city_isp_org(ip)
        get("/city_isp_org/#{ip}")
      end
    end
  end
end