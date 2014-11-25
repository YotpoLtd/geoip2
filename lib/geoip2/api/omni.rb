module Geoip2
  module Api
    module Omni
      def omni(ip, faraday_options = {})
        get("/omni/#{ip}", faraday_options)
      end
    end
  end
end