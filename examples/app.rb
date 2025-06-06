# frozen_string_literal: true

require 'sinatra/base'
require 'dotenv'

require 'myob_acumatica'

Dotenv.load

module MyobAcumaticIntegration
  class App < Sinatra::Base
    set :port, 4567

    get '/' do
      'Welcome to Myob Acumatica Integration!'
    end

    get '/oauth2/authorize' do
      authorize_url = MyobAcumatica::OAuth2::Token.authorize_url(
        instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
        client_id: ENV['MYOB_ACUMATICA_CLIENT_ID'],
        redirect_uri: ENV['MYOB_ACUMATICA_REDIRECT_URI'],
        scope: ENV['MYOB_ACUMATICA_SCOPE']
      )

      redirect authorize_url
    end

    get '/oauth2/callback' do
      response = MyobAcumatica::OAuth2::Token.authorize(
        instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
        client_id: ENV['MYOB_ACUMATICA_CLIENT_ID'],
        client_secret: ENV['MYOB_ACUMATICA_CLIENT_SECRET'],
        code: params[:code],
        redirect_uri: ENV['MYOB_ACUMATICA_REDIRECT_URI'],
        logger: logger
      )

      customers = MyobAcumatica::Api::Customer.get_list(
        instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
        access_token: response['access_token'],
        endpoint_name: ENV['MYOB_ACUMATICA_ENDPOINT_NAME'],
        endpoint_version: ENV['MYOB_ACUMATICA_ENDPOINT_VERSION'],
        logger: Logger.new($stdout)
      )

      content_type :json

      {
        response: response,
        customers: customers
      }.to_json
    end

    get '/oauth2/refresh' do
      response = MyobAcumatica::OAuth2::Token.refresh(
        instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET'],
        refresh_token: params[:refresh_token],
        logger: Logger.new($stdout)
      )

      content_type :json

      {
        refresh_token: params[:refresh_token],
        response: response
      }.to_json
    end

    # get '/customers' do
    #   timestamp = (Time.now - 1 * 3600).utc.strftime('%Y-%m-%dT%H:%M:%S.%L+00:00')
    #   filter = "Status eq 'Active' and LastModifiedDateTime gt datetimeoffset'#{timestamp}'"

    #   customers = MyobAcumatica::Api::Customer.get_list(
    #     instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
    #     access_token: params['access_token'],
    #     query_params: {
    #       '$select' => 'CustomerID, CustomerName, LastModifiedDateTime',
    #       '$filter' => filter,
    #       '$expand' => 'Contacts',
    #       '$skip' => 0,
    #       '$top' => 2
    #     },
    #     endpoint_name: ENV['MYOB_ACUMATICA_ENDPOINT_NAME'],
    #     endpoint_version: ENV['MYOB_ACUMATICA_ENDPOINT_VERSION'],
    #     logger: Logger.new($stdout)
    #   )

    #   content_type :json

    #   {
    #     customers: customers
    #   }.to_json
    # end

    get '/customers' do
      page_size = 1
      skip = 0

      customer_enum = Enumerator.new do |yielder|
        customers = MyobAcumatica::Api::Customer.get_list(
          instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
          access_token: params['access_token'],
          query_params: {
            '$top' => page_size,
            '$skip' => skip
          }
        )

        while customers.size == page_size
          yielder << customers
          skip += page_size

          customers = MyobAcumatica::Api::Customer.get_list(
            instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
            access_token: params['access_token'],
            query_params: {
              '$top' => page_size,
              '$skip' => skip
            }
          )
        end

        yielder << customers if customers.any?
      end

      customers = customer_enum.flat_map(&:itself)

      content_type :json

      { customers: customers }.to_json
    end

    get '/sales_invoices' do
      sales_invoices = MyobAcumatica::Api::SalesInvoice.get_list(
        instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
        access_token: params['access_token'],
        endpoint_name: ENV['MYOB_ACUMATICA_ENDPOINT_NAME'],
        endpoint_version: ENV['MYOB_ACUMATICA_ENDPOINT_VERSION'],
        logger: Logger.new($stdout)
      )

      content_type :json

      {
        sales_invoices: sales_invoices
      }.to_json
    end

    get '/invoices' do
      invoices = MyobAcumatica::Api::Invoice.get_list(
        instance_name: ENV['MYOB_ACUMATICA_INSTANCE_NAME'],
        access_token: params['access_token'],
        endpoint_name: ENV['MYOB_ACUMATICA_ENDPOINT_NAME'],
        endpoint_version: ENV['MYOB_ACUMATICA_ENDPOINT_VERSION'],
        logger: Logger.new($stdout)
      )

      content_type :json

      {
        invoices: invoices
      }.to_json
    end

    run! if app_file == $PROGRAM_NAME
  end
end

# bundle exec rerun --pattern '**/*.rb' ruby examples/app.rb
