# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Invoice API endpoints.
    module Invoice
      module_function

      # Deletes an invoice by ID.
      # @example Delete an invoice by ID
      #   MyobAcumatica::Api::Invoice.delete_by_id(
      #     access_token: '...',
      #     id: '00000000-0000-4000-8000-000000000000',
      #     instance_name: 'example.myobadvanced.com',
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The unique ID of the invoice.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
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
          path: "Invoice/#{id}",
          logger: logger
        )
      end

      # Deletes an invoice by composite keys.
      # @example Delete an invoice by keys
      #   MyobAcumatica::Api::Invoice.delete_by_keys(
      #     access_token: '...',
      #     keys: ['AR', 'INV000123'],
      #     instance_name: 'example.myobadvanced.com'
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] An array of keys that uniquely identify the invoice.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
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
          path: "Invoice/#{keys.join('/')}",
          logger: logger
        )
      end

      # Retrieves the ad-hoc schema for the invoice endpoint.
      # @example Retrieve the ad-hoc schema
      #   MyobAcumatica::Api::Invoice.get_ad_hoc_schema(
      #     access_token: '...',
      #     instance_name: 'example.myobadvanced.com'
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The ad hoc schema
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
          path: 'Invoice/$adHocSchema',
          logger: logger
        )
      end

      # Retrieves an invoice by keys.
      # @example Retrieve an invoice by keys
      #   MyobAcumatica::Api::Invoice.get_by_keys(
      #     access_token: '...',
      #     keys: ['AR', 'INV000123'],
      #     instance_name: 'example.myobadvanced.com'
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] An array of keys that uniquely identify the invoice.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The invoice.
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
          path: "Invoice/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves an invoice by unique ID.
      #
      # @example Retrieve an invoice by ID
      #   MyobAcumatica::Api::Invoice.get_by_id(
      #     access_token: '...',
      #     id: 'b8c01a2d-ff7f-4f0f-bba5-abc123456789',
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The unique invoice ID (UUID).
      # @param query_params [Hash] Optional query parameters for the request.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [Hash] The invoice with the given ID.
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
          path: "Invoice/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a list of invoices.
      # @example Retrieve a list of invoices
      #   MyobAcumatica::Api::Invoice.get_list(
      #     access_token: '...',
      #     query_params: { '$top' => 10 },
      #     instance_name: 'example.myobadvanced.com'
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Array<Hash>] A list of invoices.
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
          path: 'Invoice',
          query_params: query_params,
          logger: logger
        )
      end

      # Creates or updates an invoice entity.
      # @example Create or update an invoice
      #   MyobAcumatica::Api::Invoice.put_entity(
      #     access_token: '...',
      #     entity: {
      #       'CustomerID' => { 'value' => 'JOHNGOOD' },
      #       'Type' => { 'value' => 'Invoice' },
      #       'InvoiceNbr' => { 'value' => 'INV000123' }
      #     },
      #     instance_name: 'example.myobadvanced.com'
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param entity [Hash] The invoice entity to create or update.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The updated or created invoice.
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
          path: 'Invoice',
          body: entity,
          query_params: query_params,
          logger: logger
        )
      end

      # Uploads a file to a specific invoice record by resolving the `files:put` link.
      #
      # @example Upload a PDF to an invoice
      #   MyobAcumatica::Api::Invoice.put_file(
      #     access_token: '...',
      #     keys: ['AR', 'INV000123'],
      #     file_path: 'examples/invoice.pdf',
      #     instance_name: 'example.myobadvanced.com'
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] Key(s) identifying the invoice record.
      # @param file_path [String] Full path to the file to be uploaded.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [nil] Returns nil if successful.
      # @raise [MyobAcumatica::Error] If the upload fails.
      def put_file(access_token:, keys:, file_path:,
                   instance_name: INSTANCE_NAME,
                   endpoint_name: ENDPOINT_NAME,
                   endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        invoice = get_by_keys(
          access_token: access_token,
          keys: keys,
          instance_name: instance_name,
          logger: logger
        )

        put_url_template = invoice.dig('_links', 'files:put')
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

      # Invokes a custom action on the Invoice entity.
      #
      # @example Apply a payment or custom action
      #   MyobAcumatica::Api::Invoice.invoke_action(
      #     access_token: '...',
      #     action_name: 'ReleaseInvoice',
      #     entity: { 'Type' => { 'value' => 'Invoice' }, 'InvoiceNbr' => { 'value' => 'INV000123' } },
      #     instance_name: 'example.myobadvanced.com'
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param action_name [String] The name of the action to invoke.
      # @param entity [Hash] The invoice entity on which to invoke the action.
      # @param parameters [Hash] Optional parameters for the action.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [Hash, nil] The response from the action.
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
          path: "Invoice/#{action_name}",
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      # Releases an invoice.
      #
      # @example Release an invoice
      #   MyobAcumatica::Api::Invoice.release(
      #     access_token: '...',
      #     entity: {
      #       'Type' => { 'value' => 'Invoice' },
      #       'InvoiceNbr' => { 'value' => 'INV000123' }
      #     },
      #     instance_name: 'example.myobadvanced.com'
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param entity [Hash] The entity.
      # @param parameters [Hash] The parameters.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [Hash] The response from the release action.
      def release(access_token:, entity:, parameters: nil,
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
          path: 'Invoice/ReleaseInvoice',
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end
    end
  end
end
