# frozen_string_literal: true

module MyobAcumatica
  module Api
    module Http
      module_function

      # rubocop:disable Metrics/AbcSize
      def request(instance_name:, access_token:, method:,
                  endpoint_name:, endpoint_version:, path:,
                  accept: 'application/json', content_type: 'application/json',
                  query_params: {}, body: nil, logger: nil)
        uri = URI.join("https://#{instance_name}/", 'entity/', "#{endpoint_name}/", "#{endpoint_version}/", path.to_s)
        uri.query = URI.encode_www_form(query_params) unless query_params.empty?

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.set_debug_output(logger) unless logger.nil?

        request_class = case method
                        when :get then Net::HTTP::Get
                        when :post then Net::HTTP::Post
                        when :put then Net::HTTP::Put
                        when :delete then Net::HTTP::Delete
                        end

        request = request_class.new(uri)
        request['Authorization'] = "Bearer #{access_token}"
        request['Content-Type'] = content_type
        request['Accept'] = accept
        request.body = content_type == 'application/json' ? body.to_json : body

        response = http.request(request)

        case response
        when Net::HTTPNoContent
          nil
        when Net::HTTPSuccess
          JSON.parse(response.body)
        else
          raise MyobAcumatica::Error, "HTTP #{response.code}: #{response.body}"
        end
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
