# frozen_string_literal: true

# rubocop:disable Lint/UselessAssignment

require 'json'
require 'logger'
require 'dotenv'
require 'myob_acumatica'

Dotenv.load

instance_name = ENV['INSTANCE_NAME']
access_token = ENV['ACCESS_TOKEN']
logger = Logger.new($stdout)

invoice_key = 'INV0001'
customer_key = 'JOHNGOOD'

sales_invoice = MyobAcumatica::Api::SalesInvoice.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => customer_key },
    'Date' => { 'value' => Time.now.strftime('%Y-%m-%d') },
    'Hold' => { 'value' => false },
    'Details' => [
      {
        'InventoryID' => { 'value' => 'AASERVICES' },
        'Qty' => { 'value' => 1 },
        'UnitPrice' => { 'value' => 100 }
      }
    ]
  },
  logger: logger
)

invoice_id = sales_invoice['id']

sales_invoice = MyobAcumatica::Api::SalesInvoice.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'CustomerID' => { 'value' => customer_key },
    'Hold' => { 'value' => true }
  },
  logger: logger
)

sales_invoice = MyobAcumatica::Api::SalesInvoice.get_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: invoice_id,
  logger: logger
)

sales_invoice = MyobAcumatica::Api::SalesInvoice.get_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice_key],
  logger: logger
)

sales_invoices = MyobAcumatica::Api::SalesInvoice.get_list(
  instance_name: instance_name,
  access_token: access_token,
  query_params: {
    '$select' => 'CustomerID, ReferenceNbr, Date',
    '$filter' => "CustomerID eq '#{customer_key}'",
    '$top' => 10,
    '$skip' => 0
  },
  logger: logger
)

MyobAcumatica::Api::SalesInvoice.delete_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice_key],
  logger: logger
)

MyobAcumatica::Api::SalesInvoice.delete_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: invoice_id,
  logger: logger
)

schema = MyobAcumatica::Api::SalesInvoice.get_ad_hoc_schema(
  instance_name: instance_name,
  access_token: access_token,
  logger: logger
)

MyobAcumatica::Api::SalesInvoice.put_file(
  instance_name: instance_name,
  access_token: access_token,
  ids: invoice_id,
  filename: 'invoice.pdf',
  logger: logger
)

release_response = MyobAcumatica::Api::SalesInvoice.release(
  instance_name: instance_name,
  access_token: access_token,
  body: { 'entity' => { 'id' => invoice_id } },
  logger: logger
)

# rubocop:enable Lint/UselessAssignment
