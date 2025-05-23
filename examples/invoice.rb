# frozen_string_literal: true

require 'json'
require 'logger'
require 'date'
require 'dotenv'
require 'myob_acumatica'

Dotenv.load

instance_name = ENV['INSTANCE_NAME']
access_token = ENV['ACCESS_TOKEN']
logger = Logger.new($stdout)

invoice_key = 'INV001'

invoice = MyobAcumatica::Api::Invoice.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => 'CUST001' },
    'Date'       => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate'    => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'DiscDate'   => { 'value' => (Date.today + 10).strftime('%Y-%m-%d') },
    'Terms'      => { 'value' => '30D' }, # must match a valid term in your tenant
    'Type'       => { 'value' => 'Invoice' },
    'Hold'       => { 'value' => false },
    'Details'    => [
      {
        'InventoryID' => { 'value' => 'ITEM001' },
        'Qty'         => { 'value' => 1 },
        'UnitPrice'   => { 'value' => 150 }
      }
    ]
  },
  logger: logger
)

invoice_id = invoice['id']

invoice_by_id = MyobAcumatica::Api::Invoice.get_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: invoice_id,
  logger: logger
)

invoice_by_keys = MyobAcumatica::Api::Invoice.get_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice_key],
  logger: logger
)

invoice_list = MyobAcumatica::Api::Invoice.get_list(
  instance_name: instance_name,
  access_token: access_token,
  query_params: {
    '$top' => 5,
    '$filter' => "Status eq 'Open'"
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.delete_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice_key],
  logger: logger
)

MyobAcumatica::Api::Invoice.delete_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: invoice_id,
  logger: logger
)

schema = MyobAcumatica::Api::Invoice.get_ad_hoc_schema(
  instance_name: instance_name,
  access_token: access_token,
  logger: logger
)

MyobAcumatica::Api::Invoice.put_file(
  instance_name: instance_name,
  access_token: access_token,
  ids: invoice_id,
  filename: 'invoice.pdf',
  logger: logger
)

custom_action_result = MyobAcumatica::Api::Invoice.invoke_action_custom_action(
  instance_name: instance_name,
  access_token: access_token,
  action_name: 'VoidInvoice',
  body: { 'entity' => { 'id' => invoice_id } },
  logger: logger
)

release_response = MyobAcumatica::Api::Invoice.release(
  instance_name: instance_name,
  access_token: access_token,
  body: { 'entity' => { 'id' => invoice_id } },
  logger: logger
)
