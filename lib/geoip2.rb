require 'geoip2/version'
require 'geoip2/client'

module Geoip2
  class << self
    # @!attribute host
    # @return [String] the host of MaxMind that you would like to work with
    attr_accessor :host

    # @!attribute base_path
    # @return [String] the base path on the host to the api
    attr_accessor :base_path

    # @!attribute parallel_requests
    # @return [Integer String] defines the maximum parallel request for the gem to preform
    attr_accessor :parallel_requests

    # @!attribute user_id
    # @return [String] the user id that is used to authenticate with MaxMind
    attr_accessor :user_id

    # @!attribute license_key
    # @return [String] the license key that is used to authenticate with MaxMind
    attr_accessor :license_key

    # Configuration interface of the gem
    #
    # @yield [self] to accept configuration settings
    def configure
      yield self
      true
    end

    #
    # Makes sure that the method missing is checked with the Geoip2::Client instance
    #
    # @param method_name [String] the name of the method we want to run
    # @param include_private [Boolean] defines wether to check for private functions as well
    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end

    #
    # @return an instance of Geoip2::Client
    #
    def client
      @client = Geoip2::Client.new({
          host: self.host || 'geoip.maxmind.com',
          base_path: self.base_path || '/geoip/v2.0',
          parallel_requests: self.parallel_requests || 5,
          user_id: self.user_id,
          license_key: self.license_key
                                    })
    end

    private

    #
    # executes any function on the Geoip2::Client instance
    #
    # @param args [*] any argument that we want to pass to the client function
    # @param block [Block] any block that is passed to the client function
    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end