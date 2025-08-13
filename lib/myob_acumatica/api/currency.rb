# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Currency API endpoints.
    module Currency
      module_function

      ##
      # Deletes a currency record by its session UUID.
      #
      # @example Delete a currency by ID
      #   MyobAcumatica::Api::Currency.delete_by_id(
      #     access_token: access_token,
      #     id: currency['id'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param id [String] Session UUID of the currency record.
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
          path: "Currency/#{id}",
          logger: logger
        )
      end

      ##
      # Deletes a currency record by composite keys.
      #
      # Keys are ordered values of the record's key fields.
      #
      # @example Delete a currency by keys
      #   MyobAcumatica::Api::Currency.delete_by_keys(
      #     access_token: access_token,
      #     keys: [currency['CurrencyID']['value']],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Key values identifying the currency record.
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
          path: "Currency/#{keys.join('/')}",
          logger: logger
        )
      end

      ##
      # Retrieves the ad-hoc schema (custom fields) for the Currency entity.
      #
      # @example Retrieve ad-hoc schema
      #   MyobAcumatica::Api::Currency.get_ad_hoc_schema(
      #     access_token: access_token,
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] Ad-hoc schema payload.
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
          path: 'Currency/$adHocSchema',
          logger: logger
        )
      end

      ##
      # Retrieves a currency record by its session UUID.
      #
      # @example Get currency by ID
      #   MyobAcumatica::Api::Currency.get_by_id(
      #     access_token: access_token,
      #     id: currency['id'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param id [String] Session UUID of the currency record.
      # @param query_params [Hash] Optional query params ($select, $expand, $filter,
      #   $custom).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The currency record.
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
          path: "Currency/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Retrieves a currency record by composite keys.
      #
      # @example Get currency by keys
      #   MyobAcumatica::Api::Currency.get_by_keys(
      #     access_token: access_token,
      #     keys: ['USD'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Key values identifying the currency record.
      # @param query_params [Hash] Optional query params.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The currency record.
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
          path: "Currency/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Retrieves a list of currency records with optional filtering and paging.
      #
      # @example List currencies
      #   MyobAcumatica::Api::Currency.get_list(
      #     access_token: access_token,
      #     query_params: { '$top' => 10 },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param query_params [Hash] Optional query params.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Array<Hash>] List of currency records.
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
          path: 'Currency',
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Invokes a custom action on a currency record.
      #
      # @example Invoke a custom action
      #   MyobAcumatica::Api::Currency.invoke_action(
      #     access_token: access_token,
      #     action_name: 'CustomAction',
      #     entity: { 'id' => currency['id'] },
      #     parameters: {},
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param action_name [String] The action name to invoke.
      # @param entity [Hash] Currency entity payload.
      # @param parameters [Hash] Optional parameters for the action.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash, nil] Action response or nil on 204.
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
          path: "Currency/#{action_name}",
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      ##
      # Creates or updates a currency record.
      #
      # @example Create or update a currency
      #   usd = MyobAcumatica::Api::Currency.put_entity(
      #     access_token: access_token,
      #     entity: { 'CurrencyID' => { 'value' => 'USD' } },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Currency entity payload.
      # @param query_params [Hash] Optional query params.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The created or updated currency record.
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
          path: 'Currency',
          body: entity,
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Attaches a file to a currency record.
      #
      # @example Upload a file to a currency record
      #   MyobAcumatica::Api::Currency.put_file(
      #     access_token: access_token,
      #     keys: ['USD'],
      #     file_path: 'examples/rate-sheet.pdf',
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Key values identifying the currency record.
      # @param file_path [String] Path to the file.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [nil]
      def put_file(access_token:, keys:, file_path:,
                   instance_name: INSTANCE_NAME,
                   endpoint_name: ENDPOINT_NAME,
                   endpoint_version: ENDPOINT_VERSION,
                   logger: nil)
        entity = get_by_keys(
          access_token: access_token,
          keys: keys,
          instance_name: instance_name,
          endpoint_name: endpoint_name,
          endpoint_version: endpoint_version,
          logger: logger
        )

        put_template = entity.dig('_links', 'files:put')
        raise MyobAcumatica::Error, 'files:put link not found' unless put_template

        filename = File.basename(file_path)
        path = put_template.gsub('{filename}', filename)

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
