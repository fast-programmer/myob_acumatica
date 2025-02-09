# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module MyobAcumatica
  module Api
    ENDPOINT_NAME = 'Default'
    ENDPOINT_PATH = '20.200.001'

    module Http
      module_function

      def request(access_token:, method:, instance_url:, endpoint_name:, endpoint_version:, path:,
                  query_params: nil, body: nil, logger: nil)
        uri = URI("https://#{instance_url}/entity/#{endpoint_name}/#{endpoint_version}/#{path}")
        uri.query = URI.encode_www_form(query_params) unless query_params.nil?

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.set_debug_output(logger) unless logger.nil?

        request_class = case method
                        when :get then Net::HTTP::Get
                        when :post then Net::HTTP::Post
                        when :put then Net::HTTP::Put
                        when :delete then Net::HTTP::Delete
                        end

        request = request_class.new(uri)
        request['Authorization'] = "Bearer #{access_token}"
        request['Content-Type'] = 'application/json'
        request['Accept'] = 'application/json'
        request.body = body.to_json unless body.nil?

        response = http.request(request)

        case response
        when Net::HTTPSuccess, Net::HTTPNoContent
          response.body.empty? ? nil : JSON.parse(response.body)
        else
          raise MyobAcumatica::Error, "HTTP #{response.code}: #{response.body}"
        end
      end
    end

    module Customer
      module_function

      def delete_by_id(access_token:, instance_url:, id:,
                       endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                       logger: nil)
        Http.request(
          access_token: access_token,
          method: :delete,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{id}",
          logger: logger
        )
      end

      def delete_by_keys(access_token:, instance_url:, keys:,
                         endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                         logger: nil)
        Http.request(
          access_token: access_token,
          method: :delete,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{keys.join('/')}",
          logger: logger
        )
      end

      def get_ad_hoc_schema(access_token:, instance_url:,
                            endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                            logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer/$adHocSchema',
          logger: logger
        )
      end

      def get_by_id(access_token:, instance_url:, id:, query_params: {},
                    endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                    logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      def get_by_keys(access_token:, instance_url:, keys:, query_params: {},
                      endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                      logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      def get_list(access_token:, instance_url:, query_params: {},
                   endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          query_params: query_params,
          logger: logger
        )
      end

      def invoke_action_custom_action(access_token:, instance_url:, action_name:, body:,
                                      endpoint_name: ENDPOINT_NAME,
                                      endpoint_version: ENDPOINT_VERSION,
                                      logger: nil)
        Http.request(
          access_token: access_token,
          method: :post,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{action_name}",
          body: body,
          logger: logger
        )
      end

      def put_entity(access_token:, instance_url:, body:, query_params: {},
                     endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                     logger: nil)
        Http.request(
          access_token: access_token,
          method: :put,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          body: body,
          query_params: query_params,
          logger: logger
        )
      end

      def put_file(access_token:, instance_url:, ids:, filename:,
                   endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          access_token: access_token,
          method: :put,
          instance_url: instance_url,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{ids}/files/#{filename}",
          logger: logger
        )
      end
    end
  end
end
