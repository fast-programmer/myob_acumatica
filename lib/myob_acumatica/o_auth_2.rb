# frozen_string_literal: true

module MyobAcumatica
  module OAuth2
    extend self

    def authorize_url(instance_url:, client_id:, redirect_uri:, scope:)
      "https://#{instance_url}/identity/connect/authorize?#{URI.encode_www_form({
        response_type: 'code',
        client_id: client_id,
        redirect_uri: redirect_uri,
        scope: scope
      })}"
    end

    def authorize(instance_url:, client_id:, client_secret:, code:, redirect_uri:, logger: nil)
      Http.post(
        uri: URI("https://#{instance_url}/identity/connect/token"),
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

    def refresh(instance_url:, client_id:, client_secret:, refresh_token:, logger: nil)
      Http.post(
        uri: URI("https://#{instance_url}/identity/connect/token"),
        body: {
          grant_type: 'refresh_token',
          client_id: client_id,
          client_secret: client_secret,
          refresh_token: refresh_token
        },
        logger: logger
      )
    end

    module Http
      extend self

      def post(uri:, body:, logger: nil)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.set_debug_output(logger) if logger

        request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/x-www-form-urlencoded')
        request.set_form_data(body)
        response = http.request(request)

        JSON.parse(response.body)
      end
    end
  end
end
