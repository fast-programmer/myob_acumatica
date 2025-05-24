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

ad_hoc_schema = MyobAcumatica::Api::Customer.get_ad_hoc_schema(
  instance_name: instance_name,
  access_token: access_token,
  logger: logger
)

customer1 = MyobAcumatica::Api::Customer.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => 'JOHNGOOD' },
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

customer1 = MyobAcumatica::Api::Customer.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => 'JOHNGOOD' },
    'CustomerName' => { 'value' => 'John Good Updated 2' }
  },
  logger: logger
)

customer2 = MyobAcumatica::Api::Customer.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => 'STEVEYELLOW' },
    'CustomerName' => { 'value' => 'Steve Yellow' },
    'CustomerClass' => { 'value' => 'CUSTDFT' },
    'MainContact' => {
      'Email' => { 'value' => 'demo@gmail.com' },
      'Address' => {
        'AddressLine1' => { 'value' => '2030 Lake Washington Blvd NE' },
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

customer1 = MyobAcumatica::Api::Customer.get_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: ['JOHNGOOD'],
  logger: logger
)

# FIXME
# MyobAcumatica::Api::Customer.invoke_action_custom_action(
#   instance_name: instance_name,
#   access_token: access_token,
#   action_name: "CreateContactFromCustomer",
#   body: {
#     "entity" => {
#       "CustomerID" => { "value" => "JOHNGOOD" },
#       "FirstName"    => { "value" => "John" },
#       "LastName"     => { "value" => "Smith" },
#       "JobTitle"     => { "value" => "Director" },
#       "Phone1Type"   => { "value" => "Mobile" },
#       "Phone1"       => { "value" => "0400123456" },
#       "Phone2Type"   => { "value" => "Work" },
#       "Phone2"       => { "value" => "0298765432" },
#       "Email"        => { "value" => "john.smith@example.com" },
#       "ContactClass" => { "value" => "DEFAULT" }
#     }
#   },
#   logger: logger
# )

# FIXME
# put_file_response = MyobAcumatica::Api::Customer.put_file(
#   instance_name: instance_name,
#   access_token: access_token,
#   ids: customer["id"],
#   filename: 'examples/dummy.pdf',
#   logger: logger
# )

customer = MyobAcumatica::Api::Customer.get_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: customer1['id'],
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

MyobAcumatica::Api::Customer.delete_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: customer1['id'],
  logger: logger
)

MyobAcumatica::Api::Customer.delete_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: ['STEVEYELLOW'],
  logger: logger
)

# rubocop:enable Lint/UselessAssignment
