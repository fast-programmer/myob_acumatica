# frozen_string_literal: true

module MyobAcumatica
  module OAuth2
    # Handles the OAuth2 flow for authenticating with MYOB Acumatica.
    module Token
      module_function

      # Generates the OAuth2 authorization URL to initiate the login flow.
      #
      # @example Generate the URL to initiate the OAuth2 login
      #   MyobAcumatica::OAuth2::Token.authorize_url(
      #     redirect_uri: 'https://example.myobadvanced.com/oauth2/callback',
      #     instance_name: 'example.myobadvanced.com',
      #     client_id: 'abc123',
      #     scope: 'api offline_access'
      #   )
      #   # => "https://example.myobadvanced.com/identity/connect/authorize?response_type=code&client_id=abc123&redirect_uri=https%3A%2F%2Fexample.myobadvanced.com%2Foauth2%2Fcallback&scope=api+offline_access"
      #
      # @param redirect_uri [String] The OAuth2 redirect URI.
      # @param instance_name [String] The Acumatica instance name.
      # @param client_id [String] The OAuth2 client ID.
      # @param scope [String] A space-delimited list of scopes.
      # @return [String] The URL to redirect users for authorization.
      def authorize_url(
        redirect_uri: REDIRECT_URI,
        instance_name: INSTANCE_NAME,
        client_id: CLIENT_ID,
        scope: SCOPE
      )
        "https://#{instance_name}/identity/connect/authorize?" \
        "#{URI.encode_www_form({
          response_type: 'code',
          client_id: client_id,
          redirect_uri: redirect_uri,
          scope: scope
        })}"
      end

      # Exchanges an authorization code for an access token.
      #
      # @example Exchange the code for an access token
      #   token = MyobAcumatica::OAuth2::Token.authorize(
      #     code: 'abc123',
      #     redirect_uri: 'http://localhost:4567/oauth2/callback'
      #   )
      #
      # @param code [String] The authorization code received from the login flow.
      # @param redirect_uri [String] The OAuth2 redirect URI.
      # @param instance_name [String] The Acumatica instance name.
      # @param client_id [String] The OAuth2 client ID.
      # @param client_secret [String] The OAuth2 client secret.
      # @param logger [Logger, nil] Optional logger for debugging HTTP requests.
      # @return [Hash] The token response with keys:
      #   - access_token [String] The bearer token.
      #   - token_type [String] Typically "Bearer".
      #   - expires_in [Integer] Number of seconds until expiration.
      #   - refresh_token [String] Used to obtain a new access token.
      #   - scope [String] Space-delimited list of granted scopes.
      def authorize(
        code:,
        redirect_uri: REDIRECT_URI,
        instance_name: INSTANCE_NAME,
        client_id: CLIENT_ID,
        client_secret: CLIENT_SECRET,
        logger: nil
      )
        Http.post(
          uri: URI("https://#{instance_name}/identity/connect/token"),
          body: {
            grant_type: 'authorization_code',
            client_id: client_id,
            client_secret: client_secret,
            code: code,
            redirect_uri: redirect_uri
          },
          logger: logger
        )
      end

      # Refreshes the access token using a refresh token.
      #
      # @example Refresh the token
      #   token = MyobAcumatica::OAuth2::Token.refresh(
      #     refresh_token: token['refresh_token']
      #   )
      #
      # @param refresh_token [String] The previously issued refresh token.
      # @param instance_name [String] The Acumatica instance name.
      # @param client_id [String] The OAuth2 client ID.
      # @param client_secret [String] The OAuth2 client secret.
      # @param logger [Logger, nil] Optional logger for debugging HTTP requests.
      # @return [Hash] The refreshed token response with keys:
      #   - access_token [String] The new bearer token.
      #   - token_type [String] Typically "Bearer".
      #   - expires_in [Integer] Number of seconds until expiration.
      #   - refresh_token [String] Used to obtain the next access token.
      #   - scope [String] Space-delimited list of granted scopes.
      def refresh(
        refresh_token:,
        instance_name: INSTANCE_NAME,
        client_id: CLIENT_ID,
        client_secret: CLIENT_SECRET,
        logger: nil
      )
        Http.post(
          uri: URI("https://#{instance_name}/identity/connect/token"),
          body: {
            grant_type: 'refresh_token',
            client_id: client_id,
            client_secret: client_secret,
            refresh_token: refresh_token
          },
          logger: logger
        )
      end
    end
  end
end
