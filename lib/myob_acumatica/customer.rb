# frozen_string_literal: true
module MyobAcumatica
  module Customer
    extend self

    def list(instance_url:, endpoint_name:, endpoint_version:, access_token:, query_params: {}, logger: nil)
      uri = URI("https://#{instance_url}/entity/#{endpoint_name}/#{endpoint_version}/Customer")
      uri.query = URI.encode_www_form(query_params) unless query_params.empty?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.set_debug_output(logger) if logger

      request = Net::HTTP::Get.new(uri, {
        'Authorization' => "Bearer #{access_token}",
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      })

      response = http.request(request)

      JSON.parse(response.body)
    end
  end
end
