require 'net/http'
require 'uri'
require 'json'

module Auspost
  module API
    def self.key
      '28744ed5982391881611cca6cf5c2409'
    end

    def self.host
      'test.npe.auspost.com.au'
    end

    def self.ssl_verify_mode
      OpenSSL::SSL::VERIFY_NONE
      # OpenSSL::SSL::VERIFY_PEER
    end

    def self.use_ssl?
      false
    end

    def self.build_uri(path, query={})
      uri_class.build([ # todo fixme https
        nil, # scheme
        host, # host
        nil, # port
        path, # path
        URI.encode_www_form(query), # query
        nil # fragment
      ])
    end

    def self.get_json(path, query={})
      uri = build_uri(path, query)
      request = Net::HTTP.start(uri.host, uri.port) do |http|
        http.verify_mode = ssl_verify_mode if use_ssl? # todo fixme
        request = Net::HTTP::Get.new(uri)
        request['AUTH-KEY'] = key
        http.request(request)
      end
      JSON(request.body)
    end

    private

    def self.uri_class
      if use_ssl?
        URI::HTTPS
      else
        URI::HTTP
      end
    end
  end
end
