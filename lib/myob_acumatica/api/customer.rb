# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Customer API endpoints.
    module Customer
      module_function

      # Deletes a customer by ID.
      # @example Delete a customer by ID
      #   MyobAcumatica::Api::Customer.delete_by_id(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     id: '00000000-0000-4000-8000-000000000000',
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param id [String] The unique ID of the customer.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
      def delete_by_id(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                       id:, logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{id}",
          logger: logger
        )
      end

      # Deletes a customer by composite keys.
      # @example Delete a customer by keys
      #   MyobAcumatica::Api::Customer.delete_by_keys(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     keys: ['JOHNGOOD'],
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param keys [Array<String>] An array of keys that uniquely identify the customer.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
      def delete_by_keys(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                         keys:, logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :delete,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{keys.join('/')}",
          logger: logger
        )
      end

      # Retrieves the ad-hoc schema for the customer endpoint.
      # @example Retrieve the ad-hoc schema
      #   MyobAcumatica::Api::Customer.get_ad_hoc_schema(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The ad hoc schema
      def get_ad_hoc_schema(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                            logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer/$adHocSchema',
          logger: logger
        )
      end

      # Retrieves a customer by ID.
      # @example Retrieve a customer by ID
      #   MyobAcumatica::Api::Customer.get_by_id(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     id: '00000000-0000-4000-8000-000000000000',
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param id [String] The unique ID of the customer.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The customer
      def get_by_id(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                    id:, query_params: {}, logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a customer by keys.
      # @example Retrieve a customer by keys
      #   MyobAcumatica::Api::Customer.get_by_keys(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     keys: ['JOHNGOOD'],
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param keys [Array<String>] An array of keys that uniquely identify the customer.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The customer
      def get_by_keys(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                      keys:, query_params: {}, logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a list of customers.
      # @example Retrieve a list of customers
      #   MyobAcumatica::Api::Customer.get_list(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     query_params: { '$top' => 10 },
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Array<Hash>] A list of customers.
      def get_list(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                   query_params: {},
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :get,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          query_params: query_params,
          logger: logger
        )
      end

      # Updates or creates a customer entity.
      #
      # @example Update or create a customer entity with detailed information
      #   MyobAcumatica::Api::Customer.put_entity(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     entity: {
      #       'CustomerID' => { 'value' => 'JOHNGOOD' },
      #       'CustomerName' => { 'value' => 'John Good' },
      #       'CustomerClass' => { 'value' => 'CUSTDFT' }
      #     }
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The name of the instance.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param entity [Hash] The customer entity.
      # @param query_params [Hash] Optional query parameters.
      # @param logger [Logger, nil] Optional logger for request debugging.
      # @return [Hash] The response from the server.
      def put_entity(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                     entity:, query_params: {},
                     logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          body: entity,
          query_params: query_params,
          logger: logger
        )
      end

      # Uploads a file to a specific customer record by resolving the `files:put` link.
      #
      # @example Upload a PDF to a customer record
      #   MyobAcumatica::Api::Customer.put_file(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     keys: ['JOHNGOOD'],
      #     file_path: 'examples/sample.pdf'
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The name of the instance.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param keys [Array<String>] Key(s) identifying the customer record.
      # @param file_path [String] Full path to the file to be uploaded.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [nil] Returns nil if successful.
      # @raise [MyobAcumatica::Error] If the upload fails.
      def put_file(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                   keys:, file_path:, logger: nil)
        customer = get_by_keys(
          access_token: access_token,
          instance_name: instance_name,
          keys: keys,
          logger: logger
        )

        put_url_template = customer.dig('_links', 'files:put')
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

      # Invokes a custom action on the Customer entity.
      #
      # @example Invoke the 'CreateContactFromCustomer' action
      #   MyobAcumatica::Api::Customer.invoke_action(
      #     access_token: 'abc',
      #     instance_name: 'example.myobadvanced.com',
      #     endpoint_name: 'Default',
      #     endpoint_version: '20.200.001',
      #     action_name: 'CreateContactFromCustomer',
      #     entity: { 'CustomerID' => { 'value' => 'JOHNGOOD' } },
      #     parameters: {
      #       'FirstName' => { 'value' => 'John' },
      #       'LastName' => { 'value' => 'Smith' }
      #     },
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param action_name [String] The name of the action to invoke (e.g., 'CreateContactFromCustomer').
      # @param entity [Hash] The entity payload on which to invoke the action.
      # @param parameters [Hash] Optional parameters for the action.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [Hash, nil] The response from the action, if any.
      def invoke_action(access_token:, instance_name:, endpoint_name:, endpoint_version:,
                        action_name:, entity:, parameters: {}, logger: nil)
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
    end
  end
end
