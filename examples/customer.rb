# frozen_string_literal: true

# rubocop:disable Lint/UselessAssignment

require 'json'
require 'logger'
require 'byebug'
require 'dotenv'
require 'cgi'

require 'myob_acumatica'

Dotenv.load

instance_name = ENV['INSTANCE_NAME']
access_token = ENV['ACCESS_TOKEN']
logger = Logger.new($stdout)

customer_key = 'JOHNGOOD'

customer = MyobAcumatica::Api::Customer.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => customer_key },
    'CustomerName' => { 'value' => 'John Good' },
    'CustomerClass' => { 'value' => 'CUSTDFT' },
    'MainContact' => {
      'Email' => { 'value' => 'demo@gmail.com' },
      'Address' => {
        'AddressLine1' => { 'value' => '4030 Lake Washington Blvd NE' },
        'AddressLine2' => { 'value' => 'Suite 100' },
        'City' => { 'value' => 'Kirkland' },
        'State' => { 'value' => 'WA' },
        'PostalCode' => { 'value' => '98033' },
        'Country' => { 'value' => 'US' }
      }
    }
  },
  logger: logger
)

customer_id = customer['id']

customer = MyobAcumatica::Api::Customer.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => customer_key },
    'CustomerName' => { 'value' => 'John Good Updated' }
  },
  logger: logger
)

# FIXME
# invoke_action_response = MyobAcumatica::Api::Customer.invoke_action_custom_action(
#   instance_name: instance_name,
#   access_token: access_token,
#   action_name: "Activate",
#   body: { 'id' => customer_id },
#   logger: logger
# )

# FIXME
# put_file_response = MyobAcumatica::Api::Customer.put_file(
#   instance_name: instance_name,
#   access_token: access_token,
#   ids: customer_id,
#   filename: "document.pdf",
#   logger: logger
# )

customer = MyobAcumatica::Api::Customer.get_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: customer_id,
  logger: logger
)

ad_hoc_schema = MyobAcumatica::Api::Customer.get_ad_hoc_schema(
  instance_name: instance_name,
  access_token: access_token,
  logger: logger
)

customer = MyobAcumatica::Api::Customer.get_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [customer_key],
  logger: logger
)

customers = MyobAcumatica::Api::Customer.get_list(
  instance_name: instance_name,
  access_token: access_token,
  query_params: {
    '$select' => 'CustomerID, CustomerName, LastModifiedDateTime',
    '$filter' => "Status eq 'Active' and "\
      "LastModifiedDateTime gt datetimeoffset'2020-08-18T23:59:59.999+04:00'",
    '$expand' => 'Contacts',
    '$skip' => 2,
    '$top' => 3
  },
  logger: logger
)

# MyobAcumatica::Api::Customer.delete_by_id(
#   instance_name: instance_name,
#   access_token: access_token,
#   id: customer_id,
#   logger: logger
# )

MyobAcumatica::Api::Customer.delete_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [customer_key],
  logger: logger
)

# rubocop:enable Lint/UselessAssignment
