# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the SalesInvoice API endpoints.
    module SalesInvoice
      module_function

      # Deletes a sales invoice by ID.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The unique ID of the invoice.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
      def delete_by_id(instance_name:, access_token:, id:,
                       endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                       logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "SalesInvoice/#{id}",
          logger: logger
        )
      end

      # Deletes a sales invoice by composite keys.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] An array of keys that uniquely identify the invoice.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
      def delete_by_keys(instance_name:, access_token:, keys:,
                         endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                         logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "SalesInvoice/#{keys.join('/')}",
          logger: logger
        )
      end

      # Retrieves the ad-hoc schema for the sales invoice endpoint.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The ad hoc schema
      def get_ad_hoc_schema(instance_name:, access_token:,
                            endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                            logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'SalesInvoice/$adHocSchema',
          logger: logger
        )
      end

      # Retrieves a sales invoice by ID.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The unique ID of the invoice.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The invoice
      def get_by_id(instance_name:, access_token:, id:, query_params: {},
                    endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                    logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "SalesInvoice/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a sales invoice by keys.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] An array of keys that uniquely identify the invoice.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The invoice
      def get_by_keys(instance_name:, access_token:, keys:, query_params: {},
                      endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                      logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "SalesInvoice/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a list of sales invoices.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Array<Hash>] A list of invoices.
      def get_list(instance_name:, access_token:, query_params: {},
                   endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'SalesInvoice',
          query_params: query_params,
          logger: logger
        )
      end

      # Creates or updates a sales invoice entity.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param body [Hash] The body of the request containing invoice details.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
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
          path: 'SalesInvoice',
          body: body,
          query_params: query_params,
          logger: logger
        )
      end

      # Invokes a custom action on a sales invoice.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param action_name [String] The name of the action to invoke.
      # @param body [Hash] The body of the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The response
      def invoke_action_custom_action(instance_name:, access_token:, action_name:, body:,
                                      endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                                      logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "SalesInvoice/#{action_name}",
          body: body,
          logger: logger
        )
      end

      # Performs the ReleaseSalesInvoice action.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param body [Hash] The body of the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The response
      def release(instance_name:, access_token:, body:,
                  endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                  logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :post,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'SalesInvoice/ReleaseSalesInvoice',
          body: body,
          logger: logger
        )
      end

      # Attaches a file to a sales invoice.
      #
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param ids [String] The sales invoice ID.
      # @param filename [String] The filename to upload.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
      def put_file(instance_name:, access_token:, ids:, filename:,
                   endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "SalesInvoice/#{ids}/files/#{filename}",
          logger: logger
        )
      end
    end
  end
end
