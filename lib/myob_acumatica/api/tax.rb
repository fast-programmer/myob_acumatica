# frozen_string_literal: true

module MyobAcumatica
  module Api
    # Provides methods to interact with the Tax API endpoints.
    module Tax
      module_function

      ##
      # Deletes a tax record by its session UUID.
      #
      # @example Delete a tax by ID
      #   MyobAcumatica::Api::Tax.delete_by_id(
      #     access_token: access_token,
      #     id: tax['id'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param id [String] Session UUID of the tax record.
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
          path: "Tax/#{id}",
          logger: logger
        )
      end

      ##
      # Deletes a tax record by composite keys.
      #
      # Keys are ordered values of the record's key fields. For Tax this is
      # typically the TaxID (and if applicable, other key parts defined by the
      # endpoint contract).
      #
      # @example Delete a tax by keys
      #   MyobAcumatica::Api::Tax.delete_by_keys(
      #     access_token: access_token,
      #     keys: [tax['TaxID']['value']],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Key values identifying the tax record.
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
          path: "Tax/#{keys.join('/')}",
          logger: logger
        )
      end

      ##
      # Retrieves the ad-hoc schema (custom fields) for the Tax entity.
      #
      # @example Retrieve ad-hoc schema
      #   MyobAcumatica::Api::Tax.get_ad_hoc_schema(
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
          path: 'Tax/$adHocSchema',
          logger: logger
        )
      end

      ##
      # Retrieves a tax record by its session UUID.
      #
      # @example Get tax by ID
      #   MyobAcumatica::Api::Tax.get_by_id(
      #     access_token: access_token,
      #     id: tax['id'],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param id [String] Session UUID of the tax record.
      # @param query_params [Hash] Optional query params ($select, $expand, $filter,
      #   $custom).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The tax record.
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
          path: "Tax/#{id}",
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Retrieves a tax record by composite keys.
      #
      # @example Get tax by keys
      #   MyobAcumatica::Api::Tax.get_by_keys(
      #     access_token: access_token,
      #     keys: [tax_id],
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Key values identifying the tax record.
      # @param query_params [Hash] Optional query params ($select, $expand, $filter,
      #   $custom).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The tax record.
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
          path: "Tax/#{keys.join('/')}",
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Retrieves a list of tax records with optional filtering and paging.
      #
      # @example List tax records with a filter
      #   MyobAcumatica::Api::Tax.get_list(
      #     access_token: access_token,
      #     query_params: { '$filter' => 'TaxType eq 'Sales'' },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param query_params [Hash] Optional query params ($select, $expand, $filter,
      #   $custom, $skip, $top).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Array<Hash>] List of tax records.
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
          path: 'Tax',
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Invokes a custom action on a tax record.
      #
      # @example Invoke a custom action
      #   MyobAcumatica::Api::Tax.invoke_action(
      #     access_token: access_token,
      #     action_name: 'Recalculate',
      #     entity: { 'id' => tax['id'] },
      #     parameters: {},
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param action_name [String] The action name to invoke.
      # @param entity [Hash] Tax entity payload (e.g., { 'id' => uuid }).
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
          path: "Tax/#{action_name}",
          body: { 'entity' => entity, 'parameters' => parameters },
          logger: logger
        )
      end

      ##
      # Creates or updates a tax record.
      #
      # @example Create or update a tax
      #   tax = MyobAcumatica::Api::Tax.put_entity(
      #     access_token: access_token,
      #     entity: {
      #       'TaxID' => { 'value' => 'GST' },
      #       'Description' => { 'value' => 'Goods and Services Tax' }
      #     },
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param entity [Hash] Tax entity payload.
      # @param query_params [Hash] Optional query params ($select, $expand, $filter,
      #   $custom).
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @return [Hash] The created or updated tax record.
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
          path: 'Tax',
          body: entity,
          query_params: query_params,
          logger: logger
        )
      end

      ##
      # Attaches a file to a tax record. Uses the entity's files:put link to
      # construct the upload path, then uploads the binary content.
      #
      # @example Upload a file to a tax record
      #   MyobAcumatica::Api::Tax.put_file(
      #     access_token: access_token,
      #     keys: [tax['TaxID']['value']],
      #     file_path: 'examples/rate-sheet.pdf',
      #     logger: logger
      #   )
      #
      # @param access_token [String] OAuth2 access token.
      # @param keys [Array<String>] Key values identifying the tax record.
      # @param file_path [String] Absolute or relative path to the file.
      # @param instance_name [String] The instance name.
      # @param endpoint_name [String] The endpoint name.
      # @param endpoint_version [String] The endpoint version.
      # @param logger [Logger, nil] Optional logger.
      # @raise [MyobAcumatica::Error] If the files:put link is not present.
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
