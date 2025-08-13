# frozen_string_literal: true

require 'json'
require 'logger'
require 'date'
require 'dotenv/load'
require 'myob_acumatica'

access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Invoice.get_ad_hoc_schema(
  access_token: access_token,
  logger: logger
)

invoice1 = MyobAcumatica::Api::Invoice.put_entity(
  access_token: access_token,
  entity: {
    'Customer' => { 'value' => 'JOHNGOOD1' },
    'Date' => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate' => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'Terms' => { 'value' => 'NET14DAYS' },
    'Type' => { 'value' => 'Invoice' },
    'Hold' => { 'value' => false },
    'PostPeriod' => { 'value' => '08-2025' },
    'BillingAddressOverride' => { 'value' => true },
    'BillingAddress' => {
      'AddressLine1' => { 'value' => 'Fillmore Str' },
      'City' => { 'value' => 'San Francisco' },
      'State' => { 'value' => 'CA' }
    },
    'Description' => { 'value' => 'Test stock item' },
    'Details' => [
      {
        'Description' => { 'value' => 'Pair of sneakers' },
        'Quantity' => { 'value' => 1 },
        'UnitPrice' => { 'value' => 100.00 }
      }
    ],
    'custom' => {
      'Document' => {
        'DiscDate' => { 'value' => (Date.today + 10).strftime('%Y-%m-%dT00:00:00+00:00') }
      }
    }
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.release(
  access_token: access_token,
  entity: {
    'id' => invoice1['id']
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.get_by_id(
  access_token: access_token,
  id: invoice1['id'],
  logger: logger
)

MyobAcumatica::Api::Invoice.get_by_keys(
  access_token: access_token,
  keys: [invoice1['Type']['value'], invoice1['ReferenceNbr']['value']],
  logger: logger
)

MyobAcumatica::Api::Invoice.get_list(
  access_token: access_token,
  query_params: {
    '$filter' => "Type eq 'Invoice'"
    # '$filter' => "Status eq 'Open' and "\
    #   "LastModifiedDateTime gt datetimeoffset'2020-08-18T23:59:59.999+04:00'",
    # '$expand' => 'Invoices',
    # '$skip' => 1,
    # '$top' => 4
  },
  logger: logger
)

credit_memo1 = MyobAcumatica::Api::Invoice.put_entity(
  access_token: access_token,
  entity: {
    'Customer' => { 'value' => 'JOHNGOOD1' },
    'CustomerID' => { 'value' => 'JOHNGOOD1' },
    'Date' => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate' => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'Terms' => { 'value' => 'NET14DAYS' },
    'Type' => { 'value' => 'Credit Memo' },
    'Hold' => { 'value' => false },
    'PostPeriod' => { 'value' => '08-2025' },
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

MyobAcumatica::Api::Invoice.release(
  access_token: access_token,
  entity: {
    'Type' => credit_memo1['Type'],
    'ReferenceNbr' => credit_memo1['ReferenceNbr']
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.get_list(
  access_token: access_token,
  query_params: {
    '$filter' => "Type eq 'Credit Memo'"
  },
  logger: logger
)

MyobAcumatica::Api::Invoice.put_file(
  access_token: access_token,
  keys: [invoice1['Type']['value'], invoice1['ReferenceNbr']['value']],
  file_path: 'examples/dummy.pdf',
  logger: logger
)

MyobAcumatica::Api::Invoice.invoke_action(
  access_token: access_token,
  action_name: 'ReleaseInvoice',
  entity: { 'id' => invoice1['id'] },
  logger: logger
)

MyobAcumatica::Api::Invoice.delete_by_keys(
  access_token: access_token,
  keys: [invoice1['Type']['value'], invoice1['ReferenceNbr']['value']],
  logger: logger
)

invoice2 = MyobAcumatica::Api::Invoice.put_entity(
  access_token: access_token,
  entity: {
    'Customer' => { 'value' => 'JOHNGOOD2' },
    'CustomerID' => { 'value' => 'JOHNGOOD2' },
    'Date' => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate' => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'Terms' => { 'value' => 'NET14DAYS' },
    'Type' => { 'value' => 'Invoice' },
    'Hold' => { 'value' => false },
    'PostPeriod' => { 'value' => '08-2025' },
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
  access_token: access_token,
  id: invoice2['id'],
  logger: logger
)
