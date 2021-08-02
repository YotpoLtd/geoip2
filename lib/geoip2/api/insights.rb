module Geoip2
  module Api
    module Insights
      def insights(ip, faraday_options = {})
        get("/insights/#{ip}", {}, faraday_options)
      end
    end
  end
end