# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module MyobAcumatica
  module Customer
    module_function

    def list(instance_url:, endpoint_name:, endpoint_version:, access_token:,
             select: nil, filter: nil, expand: nil, custom: nil, skip: nil, top: nil, logger: nil)
      query_params = {}
      query_params['$select'] = select if select
      query_params['$filter'] = filter if filter
      query_params['$expand'] = expand if expand
      query_params['$custom'] = custom if custom
      query_params['$skip'] = skip.to_s if skip
      query_params['$top'] = top.to_s if top

      uri = URI("https://#{instance_url}/entity/#{endpoint_name}/#{endpoint_version}/Customer")
      uri.query = URI.encode_www_form(query_params) if !query_params.empty?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.set_debug_output(logger) if logger

      headers = {
        'Authorization' => "Bearer #{access_token}",
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }

      request = Net::HTTP::Get.new(uri, headers)
      response = http.request(request)

      JSON.parse(response.body)
    end
  end
end
