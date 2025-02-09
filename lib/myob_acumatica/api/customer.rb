# frozen_string_literal: true

module MyobAcumatica
  module Api
    module Customer
      module_function

      def delete_by_id(access_token:, instance_url:, id:,
                       endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
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
                     endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
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
