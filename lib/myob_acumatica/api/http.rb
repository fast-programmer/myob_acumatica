# frozen_string_literal: true

module MyobAcumatica
  module Api
    module Http
      module_function

      def request(access_token:, method:, instance_url:, endpoint_name:, endpoint_version:, path:,
                  query_params: {}, body: nil, logger: nil)
        uri = URI("https://#{instance_url}/entity/#{endpoint_name}/#{endpoint_version}/#{path}")
        uri.query = URI.encode_www_form(query_params) unless query_params.empty?

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.set_debug_output(logger) unless logger.nil?

        request_class = case method
                        when :get then Net::HTTP::Get
                        when :post then Net::HTTP::Post
                        when :put then Net::HTTP::Put
                        when :delete then Net::HTTP::Delete
                        end

        request = request_class.new(uri)
        request['Authorization'] = "Bearer #{access_token}"
        request['Content-Type'] = 'application/json'
        request['Accept'] = 'application/json'
        request.body = body.to_json unless body.nil?

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
    end
  end
end
