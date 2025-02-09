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
        instance_url: ENV['INSTANCE_URL'],
        client_id: ENV['CLIENT_ID'],
        redirect_uri: ENV['REDIRECT_URI'],
        scope: ENV['SCOPE']
      )

      redirect authorize_url
    end

    get '/oauth2/callback' do
      response = MyobAcumatica::OAuth2::Token.authorize(
        instance_url: ENV['INSTANCE_URL'],
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET'],
        code: params[:code],
        redirect_uri: ENV['REDIRECT_URI'],
        logger: logger
      )

      customers = MyobAcumatica::Api::Customer.get_list(
        instance_url: ENV['INSTANCE_URL'],
        endpoint_name: ENV['ENDPOINT_NAME'],
        endpoint_version: ENV['ENDPOINT_VERSION'],
        access_token: response['access_token'],
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
        instance_url: ENV['INSTANCE_URL'],
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

    get '/customers' do
      customers = MyobAcumatica::Api::Customer.get_list(
        instance_url: ENV['INSTANCE_URL'],
        endpoint_name: ENV['ENDPOINT_NAME'],
        endpoint_version: ENV['ENDPOINT_VERSION'],
        access_token: params['access_token'],
        query_params: {
          # '$select' => 'CustomerID, CustomerName, LastModifiedDateTime',
          # '$filter' => "Status eq 'Active'",
          # '$expand' => 'Contacts',
          # '$skip' => 2,
          # '$top' => 3
        },
        logger: Logger.new($stdout)
      )

      content_type :json

      {
        customers: customers
      }.to_json
    end

    run! if app_file == $PROGRAM_NAME
  end
end

# bundle exec rerun --pattern '**/*.rb' ruby examples/app.rb
