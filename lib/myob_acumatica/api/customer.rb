# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Customer API endpoints.

    module Customer
      module_function

      # Deletes a customer by ID.
      # @example Delete a customer by ID
      #   MyobAcumatica::Api::Customer.delete_by_id(
      #     access_token: '123...',
      #    : 'example.myobadvanced.com',
      #     id: '987...',
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The unique ID of the customer.
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
          path: "Customer/#{id}",
          logger: logger
        )
      end

      # Deletes a customer by composite keys.
      # @example Delete a customer by keys
      #   MyobAcumatica::Api::Customer.delete_by_keys(
      #     access_token: 'your_access_token',
      #    : 'example.myobadvanced.com',
      #     keys: ['key1'],
      #     logger: Logger.new($stdout)
      #   )
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param keys [Array<String>] An array of keys that uniquely identify the customer.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [nil] Always nil.
      def delete_by_keys(instance_name:, access_token:, keys:,
                         endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                         logger: nil)
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
      #     access_token: 'your_access_token',
      #    : 'example.myobadvanced.com',
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The ad hoc schema
      def get_ad_hoc_schema(instance_name:, access_token:,
                            endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
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
      #     access_token: 'your_access_token',
      #     instance_name: 'example.myobadvanced.com',
      #     id: 'customer_id',
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The instance name.
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The unique ID of the customer.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The customer
      def get_by_id(instance_name:, access_token:, id:, query_params: {},
                    endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                    logger: nil)
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
      #     access_token: 'your_access_token',
      #     instance_name: 'example.myobadvanced.com',
      #     keys: ['key1'],
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] An array of keys that uniquely identify the customer.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The customer
      def get_by_keys(instance_name:, access_token:, keys:, query_params: {},
                      endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                      logger: nil)
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
      # @example Retrieve a list of customers with specific query parameters
      #   customers = MyobAcumatica::Api::Customer.get_list(
      #     access_token: 'your_access_token',
      #     instance_name: 'example.myobadvanced.com',
      #     query_params: {
      #       '$select' => 'CustomerID, CustomerName, LastModifiedDateTime',
      #       '$filter' => "Status eq 'Active' and "\
      #         "LastModifiedDateTime gt datetimeoffset'2020-08-18T23:59:59.999+04:00'",
      #       '$expand' => 'Contacts',
      #       '$skip' => 2,
      #       '$top' => 3
      #     },
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Array<Hash>] A list of customers.
      def get_list(instance_name:, access_token:, query_params: {},
                   endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
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

      # Invokes a custom action on a customer.
      # @example Invoke a custom action on a customer
      #   MyobAcumatica::Api::Customer.invoke_action_custom_action(
      #     access_token: 'your_access_token',
      #     instance_name: 'example.myobadvanced.com',
      #     action_name: 'Activate',
      #     body: { 'id' => 'customer_id' },
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param action_name [String] The name of the action to invoke.
      # @param body [Hash] The request body parameters.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The response body
      def invoke_action_custom_action(instance_name:, access_token:, action_name:, body:,
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
          body: body,
          logger: logger
        )
      end

      alias invoke_action invoke_action_custom_action

      # Updates or creates a customer entity.
      # @example Update or create a customer entity with detailed information
      #   MyobAcumatica::Api::Customer.put_entity(
      #     access_token: 'your_access_token',
      #     instance_name: 'example.myobadvanced.com',
      #     body: {
      #       'CustomerID' => { 'value' => 'JOHNGOOD' },
      #       'CustomerName' => { 'value' => 'John Good' },
      #       'CustomerClass' => { 'value' => 'CUSTDFT' },
      #       'MainContact' => {
      #         'Email' => { 'value' => 'demo@gmail.com' },
      #         'Address' => {
      #           'AddressLine1' => { 'value' => '4030 Lake Washington Blvd NE' },
      #           'AddressLine2' => { 'value' => 'Suite 100' },
      #           'City' => { 'value' => 'Kirkland' },
      #           'State' => { 'value' => 'WA' },
      #           'PostalCode' => { 'value' => '98033' },
      #           'Country' => { 'value' => 'US' }
      #         }
      #       }
      #     },
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param body [Hash] The body of the request containing customer details.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The customer
      def put_entity(instance_name:, access_token:, body:, query_params: {},
                     endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                     logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: 'Customer',
          body: body,
          query_params: query_params,
          logger: logger
        )
      end

      # Uploads a file for a customer.
      # @example Upload a file for a customer
      #   MyobAcumatica::Api::Customer.put_file(
      #     access_token: 'your_access_token',
      #     instance_name: 'example.myobadvanced.com',
      #     ids: 'customer_id',
      #     filename: 'document.pdf',
      #     logger: Logger.new($stdout)
      #   )
      # @param instance_name [String] The of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param ids [String] The customer ID.
      # @param filename [String] The filename of the file to upload.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The response body
      def put_file(instance_name:, access_token:, ids:, filename:,
                   endpoint_name: ENDPOINT_NAME, endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        Http.request(
          instance_name: instance_name,
          access_token: access_token,
          method: :put,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          path: "Customer/#{ids}/files/#{filename}",
          logger: logger
        )
      end
    end
  end
end
