# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Customer API endpoints.

    module Customer
      module_function

      # Deletes a customer by ID.
      # @example Delete a customer by ID
      #   MyobAcumatica::Api::Customer.delete_by_id(
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
      #     id: '00000000-0000-4000-8000-000000000000',
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
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
      #     keys: ['JOHNGOOD'],
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
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
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
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
      #     id: '00000000-0000-4000-8000-000000000000',
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
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
      #     keys: ['JOHNGOOD'],
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
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
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
      # @param instance_name [String] The name of the instance.
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

      # Invokes a custom action on the Customer entity.
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

      # Updates or creates a customer entity.
      # @example Update or create a customer entity with detailed information
      #   MyobAcumatica::Api::Customer.put_entity(
      #     access_token: '...',
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
      # @param instance_name [String] The name of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param body [Hash] The body of the request containing customer details.
      # @param query_params [Hash] Additional query parameters for the request.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger for logging the request process.
      # @return [Hash] The customer.
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

      # Uploads a file to the given customer record by resolving the `files:put` link.
      #
      # @example Upload a file to a customer record
      #   MyobAcumatica::Api::Customer.put_file(
      #     instance_name: 'example.myobadvanced.com',
      #     access_token: '...',
      #     keys: ['JOHNGOOD'],
      #     file_path: 'examples/dummy.pdf',
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param instance_name [String] The name of the instance.
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] The key(s) identifying the customer record.
      # @param file_path [String] The full path to the file to be uploaded.
      # @param endpoint_name [String] The endpoint name to use.
      # @param endpoint_version [String] The endpoint version to use.
      # @param logger [Logger, nil] Optional logger for HTTP debugging.
      # @return [nil] Returns nil.
      # @raise [MyobAcumatica::Error] If the upload fails.
      def put_file(instance_name:, access_token:, keys:, file_path:,
                   endpoint_name: Api::ENDPOINT_NAME, endpoint_version: Api::ENDPOINT_VERSION,
                   logger: nil)
        customer = get_by_keys(
          instance_name: instance_name,
          access_token: access_token,
          keys: keys,
          logger: logger
        )

        put_url_template = customer.dig('_links', 'files:put')

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
    end
  end
end
