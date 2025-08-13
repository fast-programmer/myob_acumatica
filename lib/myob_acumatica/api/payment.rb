# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Payment API endpoints.

    module Payment
      module_function

      # Deletes a payment by ID.
      #
      # @example Delete a payment by ID
      #   MyobAcumatica::Api::Payment.delete_by_id(
      #     access_token: access_token,
      #     id: payment['id'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param id [String] Unique payment ID.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [nil]
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

      # Deletes a payment by composite keys.
      #
      # @example Delete a payment by keys
      #   MyobAcumatica::Api::Payment.delete_by_keys(
      #     access_token: access_token,
      #     keys: [payment['Type']['value'], payment['ReferenceNbr']['value']],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Keys uniquely identifying the payment.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [nil]
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

      # Retrieves the ad-hoc schema for the payment endpoint.
      #
      # @example Retrieve ad-hoc schema
      #   MyobAcumatica::Api::Payment.get_ad_hoc_schema(
      #     access_token: access_token,
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Ad-hoc schema.
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

      # Retrieves a payment by unique ID.
      #
      # @example Get payment by ID
      #   MyobAcumatica::Api::Payment.get_by_id(
      #     access_token: access_token,
      #     id: payment['id'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param id [String] Unique payment ID.
      # @param query_params [Hash] Optional query parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The payment.
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

      # Retrieves a payment by composite keys.
      #
      # @example Get payment by keys
      #   MyobAcumatica::Api::Payment.get_by_keys(
      #     access_token: access_token,
      #     keys: [payment['Type']['value'], payment['ReferenceNbr']['value']],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Keys uniquely identifying the payment.
      # @param query_params [Hash] Optional query parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The payment.
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

      # Retrieves a list of payments.
      #
      # @example List payments of type 'Payment'
      #   MyobAcumatica::Api::Payment.get_list(
      #     access_token: access_token,
      #     query_params: { '$filter' => "Type eq 'Payment'" },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param query_params [Hash] Optional query parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Array<Hash>] List of payments.
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

      # Creates or updates a payment entity.
      #
      # @example Create a new payment
      #   payment = MyobAcumatica::Api::Payment.put_entity(
      #     access_token: access_token,
      #     entity: {
      #       'CustomerID' => { 'value' => 'JOHNGOODPAYER' },
      #       'ApplicationDate' => { 'value' => '2025-05-6' },
      #       'PaymentMethod' => { 'value' => 'CASH' },
      #       'CashAccount' => { 'value' => 'CASHACCC' },
      #       'Hold' => { 'value' => false }
      #     },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Payment entity.
      # @param query_params [Hash] Optional query parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Created or updated payment.
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

      # Uploads a file to a payment record.
      #
      # @example Upload a PDF to a payment
      #   MyobAcumatica::Api::Payment.put_file(
      #     access_token: access_token,
      #     keys: [payment['Type']['value'], payment['ReferenceNbr']['value']],
      #     file_path: 'examples/dummy.pdf',
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Keys identifying the payment.
      # @param file_path [String] Path to the file.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @raise [MyobAcumatica::Error] If upload link not found.
      # @return [nil]
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

      # Invokes a custom action on a payment.
      #
      # @example Release a payment via invoke_action
      #   MyobAcumatica::Api::Payment.invoke_action(
      #     access_token: access_token,
      #     action_name: 'ReleasePayment',
      #     entity: { 'id' => payment['id'] },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param action_name [String] Action name.
      # @param entity [Hash] Payment entity.
      # @param parameters [Hash] Optional parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash, nil] Action response.
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

      # Captures a credit card payment.
      #
      # @example Capture an authorised credit card payment
      #   MyobAcumatica::Api::Payment.capture_credit_card_payment(
      #     access_token: access_token,
      #     entity: { 'ReferenceNbr' => { 'value' => payment['ReferenceNbr']['value'] } },
      #     parameters: { 'Amount' => { 'value' => 60.0 } },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Payment entity.
      # @param parameters [Hash] Optional parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Response from the capture action.
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

      # Performs a card operation such as Authorize or Capture.
      #
      # @example Authorise a card payment
      #   MyobAcumatica::Api::Payment.card_operation(
      #     access_token: access_token,
      #     entity: { 'ReferenceNbr' => { 'value' => payment['ReferenceNbr']['value'] } },
      #     parameters: {
      #       'Operation' => { 'value' => 'Authorize' },
      #       'Amount' => { 'value' => 60.0 }
      #     },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Payment entity.
      # @param parameters [Hash] Operation parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Response from the card operation.
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

      # Releases a payment.
      #
      # @example Release a payment
      #   MyobAcumatica::Api::Payment.release_payment(
      #     access_token: access_token,
      #     entity: { 'id' => payment['id'] },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Payment entity.
      # @param parameters [Hash] Optional parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Response from the release action.
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

      # Voids a card payment.
      #
      # @example Void a credit card payment
      #   MyobAcumatica::Api::Payment.void_card_payment(
      #     access_token: access_token,
      #     entity: { 'ReferenceNbr' => { 'value' => payment['ReferenceNbr']['value'] } },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Payment entity.
      # @param parameters [Hash] Optional parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Response from the void card payment action.
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

      # Voids a payment.
      #
      # @example Void a payment
      #   MyobAcumatica::Api::Payment.void_payment(
      #     access_token: access_token,
      #     entity: { 'ReferenceNbr' => { 'value' => payment['ReferenceNbr']['value'] } },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Payment entity.
      # @param parameters [Hash] Optional parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Response from the void payment action.
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
