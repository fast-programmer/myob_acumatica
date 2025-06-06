# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'logger'
require 'pry'

module MyobAcumatica
  class Error < StandardError; end

  INSTANCE_NAME       = ENV['MYOB_ACUMATICA_INSTANCE_NAME']
  CLIENT_ID           = ENV['MYOB_ACUMATICA_CLIENT_ID']
  CLIENT_SECRET       = ENV['MYOB_ACUMATICA_CLIENT_SECRET']
  REDIRECT_URI        = ENV['MYOB_ACUMATICA_REDIRECT_URI']
  SCOPE               = ENV['MYOB_ACUMATICA_SCOPE']
  ENDPOINT_NAME       = ENV['MYOB_ACUMATICA_ENDPOINT_NAME']
  ENDPOINT_VERSION    = ENV['MYOB_ACUMATICA_ENDPOINT_VERSION']
end

require_relative 'myob_acumatica/version'
require_relative 'myob_acumatica/o_auth_2/http'
require_relative 'myob_acumatica/o_auth_2/token'

require_relative 'myob_acumatica/api'
require_relative 'myob_acumatica/api/http'
require_relative 'myob_acumatica/api/customer'
require_relative 'myob_acumatica/api/invoice'
