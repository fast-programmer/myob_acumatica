# frozen_string_literal: true

require 'json'
require 'logger'
require 'byebug'
require 'dotenv/load'
require 'cgi'

require 'myob_acumatica'

access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Customer.get_ad_hoc_schema(
  access_token: access_token,
  logger: logger
)

customer1 = MyobAcumatica::Api::Customer.put_entity(
  access_token: access_token,
  entity: {
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
  access_token: access_token,
  entity: {
    'CustomerID' => { 'value' => customer1['CustomerID']['value'] },
    'CustomerName' => { 'value' => 'John Good Updated' }
  },
  logger: logger
)

customer1 = MyobAcumatica::Api::Customer.get_by_keys(
  access_token: access_token,
  keys: [customer1['CustomerID']['value']],
  logger: logger
)

# MyobAcumatica::Api::Customer.invoke_action(
#   access_token: access_token,
#   action_name: 'CreateContactFromCustomer',
#   entity: {
#     'CustomerID' => { 'value' => 'JOHNGOOD' }
#   },
#   parameters: {
#     'FirstName' => { 'value' => 'John' },
#     'LastName' => { 'value' => 'Smith' },
#     'JobTitle' => { 'value' => 'Director' },
#     'Email' => { 'value' => 'john.smith@example.com' },
#     'ContactClass' => { 'value' => 'DEFAULT' }
#   },
#   logger: logger
# )

MyobAcumatica::Api::Customer.put_file(
  access_token: access_token,
  keys: [customer1['CustomerID']['value']],
  file_path: 'examples/dummy.pdf',
  logger: logger
)

MyobAcumatica::Api::Customer.get_by_id(
  access_token: access_token,
  id: customer1['id'],
  logger: logger
)

MyobAcumatica::Api::Customer.get_list(
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
  access_token: access_token,
  id: customer1['id'],
  logger: logger
)

customer2 = MyobAcumatica::Api::Customer.put_entity(
  access_token: access_token,
  entity: {
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

MyobAcumatica::Api::Customer.delete_by_keys(
  access_token: access_token,
  keys: [customer2['CustomerID']['value']],
  logger: logger
)
