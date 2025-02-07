# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module MyobAcumatica
  module Api
    module Customer
      module_function

      def list(instance_url:, endpoint_name:, endpoint_version:, access_token:,
               query_params: {}, logger: nil)
        uri = URI("https://#{instance_url}/entity/#{endpoint_name}/#{endpoint_version}/Customer")
        uri.query = URI.encode_www_form(query_params) if !query_params.empty?

        Http.get(uri: uri, access_token: access_token, logger: logger)
      end

      module Http
        module_function

        def get(uri:, access_token:, logger:)
          headers = {
            'Authorization' => "Bearer #{access_token}",
            'Content-Type' => 'application/json',
            'Accept' => 'application/json'
          }

          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = uri.scheme == 'https'
          http.set_debug_output(logger) if logger

          request = Net::HTTP::Get.new(uri, headers)
          response = http.request(request)

          if !response.is_a?(Net::HTTPSuccess)
            raise MyobAcumatica::Api::Error, "HTTP #{response.code}: #{response.body}"
          end

          JSON.parse(response.body)
        end
      end
    end
  end
end
