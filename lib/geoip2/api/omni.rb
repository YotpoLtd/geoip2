module Geoip2
  module Api
    module Omni
      def omni(ip)
        get("/omni/#{ip}")
      end
    end
  end
end