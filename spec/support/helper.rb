RSpec.configure do |config|
  config.before do |example|
    Geoip2.configure do |conf|
      Geoip2.send(:reset_client)
      conf.license_key = ENV['LICENSE_KEY']
      if example.metadata[:version]
        conf.base_path = "/geoip/v#{example.metadata[:version]}"
      end
      conf.user_id = ENV['USER_ID']
    end
  end
end