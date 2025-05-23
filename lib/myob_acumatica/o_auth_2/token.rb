# frozen_string_literal: true

module MyobAcumatica
  module OAuth2
    module Token
      module_function

      def authorize_url(instance_name:, client_id:, redirect_uri:, scope:)
        "https://#{instance_name}/identity/connect/authorize?#{URI.encode_www_form({
          response_type: 'code',
          client_id: client_id,
          redirect_uri: redirect_uri,
          scope: scope
        })}"
      end

      def authorize(instance_name:, client_id:, client_secret:, code:, redirect_uri:, logger: nil)
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

      def refresh(instance_name:, client_id:, client_secret:, refresh_token:, logger: nil)
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
