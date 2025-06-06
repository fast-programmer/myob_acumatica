# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'logger'
require 'pry'

require_relative 'myob_acumatica/version'
require_relative 'myob_acumatica/o_auth_2/http'
require_relative 'myob_acumatica/o_auth_2/token'

require_relative 'myob_acumatica/api'
require_relative 'myob_acumatica/api/http'
require_relative 'myob_acumatica/api/customer'
require_relative 'myob_acumatica/api/invoice'

module MyobAcumatica
  class Error < StandardError; end
end
