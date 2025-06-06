# frozen_string_literal: true

require 'json'
require 'logger'
require 'date'
require 'dotenv'
require 'myob_acumatica'

Dotenv.load

instance_name = ENV['MYOB_ACUMATICA_INSTANCE_NAME']
access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Invoice.get_ad_hoc_schema(
  instance_name: instance_name,
  access_token: access_token,
  logger: logger
)

invoice1 = MyobAcumatica::Api::Invoice.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'Customer' => { 'value' => 'JOHNGOOD1' },
    'CustomerID' => { 'value' => 'JOHNGOOD1' },
    'Date' => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate' => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'Terms' => { 'value' => 'NET14DAYS' },
    'Type' => { 'value' => 'Invoice' },
    'Hold' => { 'value' => false },
    'BillingAddressOverride' => { 'value' => true },
    'BillingAddress' => {
      'AddressLine1' => { 'value' => 'Fillmore Str' },
      'City' => { 'value' => 'San Francisco' },
      'State' => { 'value' => 'CA' }
    },
    'custom' => {
      'Document' => {
        'DiscDate' => { 'value' => (Date.today + 10).strftime('%Y-%m-%dT00:00:00+00:00') }
      }
    }
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.get_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: invoice1['id'],
  logger: logger
)

binding.pry

MyobAcumatica::Api::Invoice.get_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice1['Type']['value'], invoice1['ReferenceNbr']['value']],
  logger: logger
)

MyobAcumatica::Api::Invoice.get_list(
  instance_name: instance_name,
  access_token: access_token,
  query_params: {
    # '$filter' => "Status eq 'Open' and "\
    #   "LastModifiedDateTime gt datetimeoffset'2020-08-18T23:59:59.999+04:00'",
    # '$expand' => 'Invoices',
    '$skip' => 1,
    '$top' => 4
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.put_file(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice1['Type']['value'], invoice1['ReferenceNbr']['value']],
  file_path: 'examples/dummy.pdf',
  logger: logger
)

MyobAcumatica::Api::Invoice.invoke_action(
  instance_name: instance_name,
  access_token: access_token,
  action_name: 'ReleaseInvoice',
  entity: { 'id' => invoice1['id'] },
  logger: logger
)

MyobAcumatica::Api::Invoice.release(
  instance_name: instance_name,
  access_token: access_token,
  body: { 'entity' => { 'id' => invoice1['id'] } },
  logger: logger
)

MyobAcumatica::Api::Invoice.delete_by_keys(
  instance_name: instance_name,
  access_token: access_token,
  keys: [invoice1['Type']['value'], invoice1['ReferenceNbr']['value']],
  logger: logger
)

invoice2 = MyobAcumatica::Api::Invoice.put_entity(
  instance_name: instance_name,
  access_token: access_token,
  body: {
    'Customer' => { 'value' => 'JOHNGOOD2' },
    'CustomerID' => { 'value' => 'JOHNGOOD2' },
    'Date' => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate' => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'Terms' => { 'value' => 'NET14DAYS' },
    'Type' => { 'value' => 'Invoice' },
    'Hold' => { 'value' => false },
    'BillingAddressOverride' => { 'value' => true },
    'BillingAddress' => {
      'AddressLine1' => { 'value' => 'Fillmore Str' },
      'City' => { 'value' => 'San Francisco' },
      'State' => { 'value' => 'CA' }
    },
    'custom' => {
      'Document' => {
        'DiscDate' => { 'value' => (Date.today + 10).strftime('%Y-%m-%dT00:00:00+00:00') }
      }
    }
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.delete_by_id(
  instance_name: instance_name,
  access_token: access_token,
  id: invoice2['id'],
  logger: logger
)
