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

      # Uploads a file to the given invoice record by resolving the `files:put` link.
      #
      # @example Upload a file to a invoice record
      #   MyobAcumatica::Api::Invoice.put_file(
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
      #     keys: ['Customer/Invoice', '000068'],
      #     file_path: 'examples/dummy.pdf',
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param instance_name [String] The name of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] The key(s) identifying the invoice record.
      # @param file_path [String] The full path to the file to be uploaded.
      # @param endpoint_name [String] The endpoint name to use.
      # @param endpoint_version [String] The endpoint version to use.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [nil] Returns nil.
      # @raise [MyobAcumatica::Error] If the upload fails.
      def put_file(instance_name:, access_token:, keys:, file_path:,
                   endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                   logger: nil)
        invoice = get_by_keys(
          instance_name: instance_name,
          access_token: access_token,
          keys: keys,
          logger: logger
        )

        put_url_template = invoice.dig('_links', 'files:put')

        if put_url_template.nil?
          raise MyobAcumatica::Error, 'files:put link not found'
        end

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

      # Invokes a custom action on the Invoice entity.
      #
      # @example Create a contact from a customer
      #   MyobAcumatica::Api::Customer.invoke_action(
      #     instance_name: instance_name,
      #     access_token: access_token,
      #     action_name: 'CreateContactFromCustomer',
      #     entity: {
      #       'CustomerID' => { 'value' => 'JOHNGOOD' }
      #     },
      #     parameters: {
      #       'FirstName'    => { 'value' => 'John' },
      #       'LastName'     => { 'value' => 'Smith' },
      #       'JobTitle'     => { 'value' => 'Director' },
      #       'Email'        => { 'value' => 'john.smith@example.com' },
      #       'ContactClass' => { 'value' => 'DEFAULT' }
      #     },
      #     logger: logger
      #   )
      #
      # @param instance_name [String] The Acumatica instance domain.
      # @param access_token [String] The OAuth2 access token.
      # @param action_name [String] The name of the action (e.g., 'CreateContactFromCustomer').
      # @param entity [Hash] The record on which to invoke the action.
      # @param parameters [Hash] Optional action parameters (default: {}).
      # @param endpoint_name [String] The endpoint name (default: 'Default').
      # @param endpoint_version [String] The endpoint version (default: '24.200.001').
      # @param logger [Logger, nil] Optional logger for debugging.
      # @return [nil, Hash]
      def invoke_action(instance_name:, access_token:,
                        action_name:, entity:, parameters: {},
                        endpoint_name: ENDPOINT_NAME,
                        endpoint_version: ENDPOINT_VERSION,
                        logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{action_name}",
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      alias invoke_action_custom_action invoke_action

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
