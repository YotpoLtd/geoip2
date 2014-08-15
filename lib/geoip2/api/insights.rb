module Geoip2
  module Api
    module Insights
      def insights(ip)
        get("/insights/#{ip}")
      end
    end
  end
end