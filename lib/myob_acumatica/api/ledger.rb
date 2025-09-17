# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Ledger API endpoints.
    #
    # All methods follow the same conventions as other entities in this gem:
    # - Paths, query params, and headers are set via Http.request
    # - Keys are joined with "/" when addressing composite primary keys
    # - Binary uploads use 'application/octet-stream'
    module Ledger
      module_function

      # Deletes a ledger by session identifier (GUID).
      #
      # @example Delete a ledger by ID
      #   MyobAcumatica::Api::Ledger.delete_by_id(
      #     access_token: '...',
      #     id: '00000000-0000-4000-8000-000000000000',
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The session GUID of the record.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
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
          path: "Ledger/#{id}",
          logger: logger
        )
      end

      # Deletes a ledger by composite keys.
      #
      # @example Delete a ledger by keys
      #   MyobAcumatica::Api::Ledger.delete_by_keys(
      #     access_token: '...',
      #     keys: ['LEDGER-ACTUAL'],
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] The key values identifying the record.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
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
          path: "Ledger/#{keys.join('/')}",
          logger: logger
        )
      end

      # Retrieves the ad-hoc schema (custom fields) for Ledger.
      #
      # @example Retrieve the ad-hoc schema
      #   MyobAcumatica::Api::Ledger.get_ad_hoc_schema(
      #     access_token: '...',
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The ad-hoc schema document.
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
          path: 'Ledger/$adHocSchema',
          logger: logger
        )
      end

      # Retrieves a ledger by session identifier (GUID).
      #
      # @example Retrieve a ledger by ID
      #   MyobAcumatica::Api::Ledger.get_by_id(
      #     access_token: '...',
      #     id: '00000000-0000-4000-8000-000000000000',
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param id [String] The session GUID of the record.
      # @param query_params [Hash] Optional query params ($select, $filter, etc.).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The ledger record.
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
          path: "Ledger/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a ledger by its key values.
      #
      # @example Retrieve a ledger by keys
      #   MyobAcumatica::Api::Ledger.get_by_keys(
      #     access_token: '...',
      #     keys: ['LEDGER-ACTUAL'],
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] The key values identifying the record.
      # @param query_params [Hash] Optional query params ($select, $filter, etc.).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The ledger record.
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
          path: "Ledger/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      # Retrieves a list of ledgers matching optional filters.
      #
      # @example Retrieve a list of ledgers
      #   MyobAcumatica::Api::Ledger.get_list(
      #     access_token: '...',
      #     query_params: { '$top' => 10 },
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param query_params [Hash] Optional query params ($select, $top, etc.).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Array<Hash>] A list of ledger records.
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
          path: 'Ledger',
          query_params: query_params,
          logger: logger
        )
      end

      # Creates or updates a ledger record.
      #
      # @example Upsert a ledger
      #   MyobAcumatica::Api::Ledger.put_entity(
      #     access_token: '...',
      #     entity: {
      #       'LedgerID' => { 'value' => 'LEDGER-ACTUAL' },
      #       'Description' => { 'value' => 'Actuals' }
      #     },
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param entity [Hash] The ledger entity payload.
      # @param query_params [Hash] Optional query params ($select, $custom, etc.).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The created or updated record.
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
          path: 'Ledger',
          body: entity,
          query_params: query_params,
          logger: logger
        )
      end

      # Attaches a file to a specific ledger record by resolving the 'files:put' link.
      #
      # @example Upload a PDF to a ledger record
      #   MyobAcumatica::Api::Ledger.put_file(
      #     access_token: '...',
      #     keys: ['LEDGER-ACTUAL'],
      #     file_path: 'examples/sample.pdf',
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param keys [Array<String>] Key(s) identifying the record.
      # @param file_path [String] Full path to the file to upload.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [nil] Returns nil if successful.
      # @raise [MyobAcumatica::Error] If the upload link is missing or request fails.
      def put_file(access_token:, keys:, file_path:,
                   instance_name: INSTANCE_NAME,
                   endpoint_name: ENDPOINT_NAME,
                   endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        ledger = get_by_keys(
          access_token: access_token,
          instance_name: instance_name,
          keys: keys,
          logger: logger
        )

        put_url_template = ledger.dig('_links', 'files:put')
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

      # Invokes a custom action on the Ledger entity.
      #
      # The API may respond with 202 (accepted, in progress) or 204 (completed).
      #
      # @example Invoke a custom action
      #   MyobAcumatica::Api::Ledger.invoke_action(
      #     access_token: '...',
      #     action_name: 'RebuildBalances',
      #     entity: { 'LedgerID' => { 'value' => 'LEDGER-ACTUAL' } },
      #     parameters: { 'FromPeriod' => { 'value' => '2024-01' } },
      #     logger: Logger.new($stdout)
      #   )
      #
      # @param access_token [String] The OAuth2 access token.
      # @param action_name [String] The action name (e.g., 'RebuildBalances').
      # @param entity [Hash] The entity on which to invoke the action.
      # @param parameters [Hash] Optional parameters for the action.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash, nil] The action response, if any.
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
          path: "Ledger/#{action_name}",
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end
    end
  end
end
