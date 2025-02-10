# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Customer API endpoints.
    module Customer
      module_function

      # Deletes a customer by ID.
      # @example Delete a customer by ID
      #   MyobAcumatica::Api::Customer.delete_by_id(
      #     access_token: 'your_access_token',
      #     instance_host: 'example.myobadvanced.com',
      #     id: 'customer_id',
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param id [String] The unique ID of the customer.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def delete_by_id(access_token:, instance_host:, id:,
                       endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                       logger: nil)
        Http.request(
          access_token: access_token,
          method: :delete,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{id}",
          logger: logger
        )
      end

      # Deletes a customer by composite keys.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param keys [Array<String>] An array of keys that uniquely identify the customer.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def delete_by_keys(access_token:, instance_host:, keys:,
                         endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                         logger: nil)
        Http.request(
          access_token: access_token,
          method: :delete,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{keys.join('/')}",
          logger: logger
        )
      end

      # Retrieves the ad-hoc schema for the customer endpoint.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def get_ad_hoc_schema(access_token:, instance_host:,
                            endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                            logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer/$adHocSchema',
          logger: logger
        )
      end

      # Retrieves a customer by ID.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param id [String] The unique ID of the customer.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def get_by_id(access_token:, instance_host:, id:, query_params: {},
                    endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                    logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a customer by keys.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param keys [Array<String>] An array of keys that uniquely identify the customer.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def get_by_keys(access_token:, instance_host:, keys:, query_params: {},
                      endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                      logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a list of customers.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Array<Hash>] A list of customers.
      def get_list(access_token:, instance_host:, query_params: {},
                   endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          access_token: access_token,
          method: :get,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          query_params: query_params,
          logger: logger
        )
      end

      # Invokes a custom action on a customer.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param action_name [String] The name of the action to invoke.
      # @param body [Hash] The request body parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def invoke_action_custom_action(access_token:, instance_host:, action_name:, body:,
                                      endpoint_name: ENDPOINT_NAME,
                                      endpoint_version: ENDPOINT_VERSION,
                                      logger: nil)
        Http.request(
          access_token: access_token,
          method: :post,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{action_name}",
          body: body,
          logger: logger
        )
      end

      alias_method :invoke_action, :invoke_action_custom_action

      # Updates or creates a customer entity.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param body [Hash] The body of the request containing customer details.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def put_entity(access_token:, instance_host:, body:, query_params: {},
                     endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                     logger: nil)
        Http.request(
          access_token: access_token,
          method: :put,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          body: body,
          query_params: query_params,
          logger: logger
        )
      end

      # Uploads a file for a customer.
      # @param access_token [String] The OAuth2 access token.
      # @param instance_host [String] The base URL of the API instance.
      # @param ids [String] The customer ID.
      # @param filename [String] The filename of the file to upload.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The HTTP response body as a hash.
      def put_file(access_token:, instance_host:, ids:, filename:,
                   endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          access_token: access_token,
          method: :put,
          instance_host: instance_host,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{ids}/files/#{filename}",
          logger: logger
        )
      end
    end
  end
end
