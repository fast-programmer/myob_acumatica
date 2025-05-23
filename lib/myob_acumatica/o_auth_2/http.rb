# frozen_string_literal: true

module MyobAcumatica
  module OAuth2
    module Http
      module_function

      def post(uri:, body:, logger: nil)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.set_debug_output(logger) if logger

        request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/x-www-form-urlencoded')
        request.set_form_data(body)
        response = http.request(request)

        if !response.is_a?(Net::HTTPSuccess)
          raise MyobAcumatica::Error, "HTTP #{response.code}: #{response.body}"
        end

        JSON.parse(response.body)
      end
    end
  end
end
