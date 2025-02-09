# frozen_string_literal: true

require 'json'
require 'logger'
require 'byebug'
require 'dotenv'

require 'myob_acumatica'

Dotenv.load

access_token = ENV['ACCESS_TOKEN']
instance_url = ENV['INSTANCE_URL']
logger = Logger.new($stdout)

# customer = MyobAcumatica::Api::Customer.put_entity(
#   access_token: access_token,
#   instance_url: instance_url,
#   body: {
#     'CustomerID' => {'value' => 'JOHNGOOD'},
#     'CustomerName' => {'value' => 'John Good'},
#     'CustomerClass' => {'value' => 'CUSTDFT'},
#     'MainContact' => {
#       'Email' => {'value' => 'demo@gmail.com'},
#       'Address' => {
#         'AddressLine1' => {'value' => '4030 Lake Washington Blvd NE'},
#         'AddressLine2' => {'value' => 'Suite 100'},
#         'City' => {'value' => 'Kirkland'},
#         'State' => {'value' => 'WA'},
#         'PostalCode' => {'value' => '98033'},
#         'Country' => {'value' => 'US'}
#       }
#     }
#   },
#   logger: logger
# )

# customer_id = customer['CustomerID']['value']

# customer = MyobAcumatica::Api::Customer.put_entity(
#   access_token: access_token,
#   instance_url: instance_url,
#   body: {
#     'CustomerID' => {'value' => 'JOHNGOOD'},
#     'CustomerName' => {'value' => 'John Good Updated'},
#   },
#   logger: logger
# )

# invoke_action_response = MyobAcumatica::Api::Customer.invoke_action_custom_action( # TODO
#   access_token: access_token,
#   instance_url: instance_url,
#   action_name: "Activate",
#   body: { id: customer_id },
#   logger: logger
# )

# put_file_response = MyobAcumatica::Api::Customer.put_file( # TODO
#   access_token: access_token,
#   instance_url: instance_url,
#   ids: customer_id,
#   filename: "document.pdf",
#   logger: logger
# )

# customer = MyobAcumatica::Api::Customer.get_by_id(
#   access_token: access_token,
#   instance_url: instance_url,
#   id: customer_id,
#   logger: logger
# )

# ad_hoc_schema = MyobAcumatica::Api::Customer.get_ad_hoc_schema(
#   access_token: access_token,
#   instance_url: instance_url,
#   logger: logger
# )

# get_by_keys_response = MyobAcumatica::Api::Customer.get_by_keys( # TODO
#   access_token: access_token,
#   instance_url: instance_url,
#   keys: ["ADAMSAPPLE", "DEMO01"],
#   logger: logger
# )

# customers = MyobAcumatica::Api::Customer.get_list(
#   access_token: access_token,
#   instance_url: instance_url,
#   query_params: {
#     '$select' => 'CustomerID, CustomerName, LastModifiedDateTime',
#     '$filter' => "Status eq 'Active'",
#     '$expand' => 'Contacts',
#     '$skip' => 2,
#     '$top' => 3
#   },
#   logger: logger
# )

# MyobAcumatica::Api::Customer.delete_by_id(
#   access_token: access_token,
#   instance_url: instance_url,
#   id: customer_id,
#   logger: logger
# )
