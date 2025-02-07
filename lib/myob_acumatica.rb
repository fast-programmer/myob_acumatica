# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'logger'
require 'pry'

require_relative 'myob_acumatica/version'
require_relative 'myob_acumatica/o_auth_2'
require_relative 'myob_acumatica/customer'

module MyobAcumatica
  class Error < StandardError; end
end
