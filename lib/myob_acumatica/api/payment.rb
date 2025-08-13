# frozen_string_literal: true

module MyobAcumatica
  module Api
    module Payment
      module_function

      def delete_by_id(access_token:, id:,
                       instance_name: INSTANCE_NAME,
                       endpoint_name: ENDPOINT_NAME,
                       endpoint_version: ENDPOINT_VERSION,
                       logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Payment/#{id}",
          logger: logger
        )
      end

      def delete_by_keys(access_token:, keys:,
                         instance_name: INSTANCE_NAME,
                         endpoint_name: ENDPOINT_NAME,
                         endpoint_version: ENDPOINT_VERSION,
                         logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Payment/#{keys.join('/')}",
          logger: logger
        )
      end

      def get_ad_hoc_schema(access_token:,
                            instance_name: INSTANCE_NAME,
                            endpoint_name: ENDPOINT_NAME,
                            endpoint_version: ENDPOINT_VERSION,
                            logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment/$adHocSchema',
          logger: logger
        )
      end

      def get_by_id(access_token:, id:, query_params: {},
                    instance_name: INSTANCE_NAME,
                    endpoint_name: ENDPOINT_NAME,
                    endpoint_version: ENDPOINT_VERSION,
                    logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Payment/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      def get_by_keys(access_token:, keys:, query_params: {},
                      instance_name: INSTANCE_NAME,
                      endpoint_name: ENDPOINT_NAME,
                      endpoint_version: ENDPOINT_VERSION,
                      logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Payment/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      def get_list(access_token:, query_params: {},
                   instance_name: INSTANCE_NAME,
                   endpoint_name: ENDPOINT_NAME,
                   endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment',
          query_params: query_params,
          logger: logger
        )
      end

      def put_entity(access_token:, entity:, query_params: {},
                     instance_name: INSTANCE_NAME,
                     endpoint_name: ENDPOINT_NAME,
                     endpoint_version: ENDPOINT_VERSION,
                     logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment',
          body: entity,
          query_params: query_params,
          logger: logger
        )
      end

      def put_file(access_token:, keys:, file_path:,
                   instance_name: INSTANCE_NAME,
                   endpoint_name: ENDPOINT_NAME,
                   endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        payment = get_by_keys(
          access_token: access_token,
          keys: keys,
          instance_name: instance_name,
          logger: logger
        )
        put_url_template = payment.dig('_links', 'files:put')
        raise MyobAcumatica::Error, 'files:put link not found' unless put_url_template
        filename = File.basename(file_path)
        path = put_url_template.gsub('{filename}', filename)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: path,
          body: File.binread(file_path),
          content_type: 'application/octet-stream',
          logger: logger
        )
      end

      def invoke_action(access_token:, action_name:, entity:, parameters: {},
                        instance_name: INSTANCE_NAME,
                        endpoint_name: ENDPOINT_NAME,
                        endpoint_version: ENDPOINT_VERSION,
                        logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Payment/#{action_name}",
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      def capture_credit_card_payment(access_token:, entity:, parameters: {},
                                      instance_name: INSTANCE_NAME,
                                      endpoint_name: ENDPOINT_NAME,
                                      endpoint_version: ENDPOINT_VERSION,
                                      logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment/CaptureCreditCardPayment',
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      def card_operation(access_token:, entity:, parameters: {},
                         instance_name: INSTANCE_NAME,
                         endpoint_name: ENDPOINT_NAME,
                         endpoint_version: ENDPOINT_VERSION,
                         logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment/CardOperation',
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      def release_payment(access_token:, entity:, parameters: {},
                          instance_name: INSTANCE_NAME,
                          endpoint_name: ENDPOINT_NAME,
                          endpoint_version: ENDPOINT_VERSION,
                          logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment/ReleasePayment',
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      def void_card_payment(access_token:, entity:, parameters: {},
                            instance_name: INSTANCE_NAME,
                            endpoint_name: ENDPOINT_NAME,
                            endpoint_version: ENDPOINT_VERSION,
                            logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment/VoidCardPayment',
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      def void_payment(access_token:, entity:, parameters: {},
                       instance_name: INSTANCE_NAME,
                       endpoint_name: ENDPOINT_NAME,
                       endpoint_version: ENDPOINT_VERSION,
                       logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Payment/VoidPayment',
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end
    end
  end
end
