# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Invoice API endpoints.
    module Invoice
      module_function

      # Deletes an invoice by session ID.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The session ID (UUID).
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      def delete_by_id(instance_name:, access_token:, id:,
                       endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                       logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Invoice/#{id}",
          logger: logger
        )
      end

      # Deletes an invoice by key fields.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] The composite keys.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      def delete_by_keys(instance_name:, access_token:, keys:,
                         endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                         logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Invoice/#{keys.join('/')}",
          logger: logger
        )
      end

      # Retrieves ad hoc schema.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Ad hoc schema.
      def get_ad_hoc_schema(instance_name:, access_token:,
                            endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                            logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Invoice/$adHocSchema',
          logger: logger
        )
      end

      # Retrieves an invoice by session ID.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The session ID.
      # @param query_params [Hash] Optional query parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The invoice.
      def get_by_id(instance_name:, access_token:, id:, query_params: {},
                    endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                    logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Invoice/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves an invoice by key fields.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] The composite keys.
      # @param query_params [Hash] Optional query parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The invoice.
      def get_by_keys(instance_name:, access_token:, keys:, query_params: {},
                      endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                      logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Invoice/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a list of invoices.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param query_params [Hash] Optional query parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Array<Hash>] The list of invoices.
      def get_list(instance_name:, access_token:, query_params: {},
                   endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Invoice',
          query_params: query_params,
          logger: logger
        )
      end

      # Creates or updates an invoice.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param body [Hash] The invoice data.
      # @param query_params [Hash] Optional query parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The created or updated invoice.
      def put_entity(instance_name:, access_token:, body:, query_params: {},
                     endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                     logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Invoice',
          body: body,
          query_params: query_params,
          logger: logger
        )
      end

      # Attaches a file to the invoice.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param ids [String] The invoice ID.
      # @param filename [String] The name of the file.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      def put_file(instance_name:, access_token:, ids:, filename:,
                   endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Invoice/#{ids}/files/#{filename}",
          logger: logger
        )
      end

      # Performs a custom action on an invoice.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param action_name [String] The custom action to invoke.
      # @param body [Hash] The body content.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      def invoke_action_custom_action(instance_name:, access_token:, action_name:, body:,
                                      endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                                      logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Invoice/#{action_name}",
          body: body,
          logger: logger
        )
      end

      # Releases an invoice.
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param body [Hash] The invoice release parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      def release(instance_name:, access_token:, body:,
                  endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                  logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Invoice/ReleaseInvoice',
          body: body,
          logger: logger
        )
      end
    end
  end
end
