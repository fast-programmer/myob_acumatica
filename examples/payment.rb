# frozen_string_literal: true

require 'json'
require 'logger'
require 'date'
require 'dotenv/load'
require 'myob_acumatica'

access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Payment.get_ad_hoc_schema(
  access_token: access_token,
  logger: logger
)

customer = MyobAcumatica::Api::Customer.put_entity(
  access_token: access_token,
  entity: {
    'CustomerID' => { 'value' => 'JOHNGOODPAYER' },
    'CustomerName' => { 'value' => 'John Good PAYER' },
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

invoice_1 = MyobAcumatica::Api::Invoice.put_entity(
  access_token: access_token,
  entity: {
    'Customer' => { 'value' => 'JOHNGOODPAYER' },
    'Date' => { 'value' => Date.today.strftime('%Y-%m-%d') },
    'DueDate' => { 'value' => (Date.today + 30).strftime('%Y-%m-%d') },
    'Terms' => { 'value' => 'NET14DAYS' },
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

puts "Created invoice: #{invoice_1['ReferenceNbr']['value']}"

MyobAcumatica::Api::Invoice.release(
  access_token: access_token,
  entity: {
    'id' => invoice_1['id']
  },
  logger: logger
)

payment_45 = MyobAcumatica::Api::Payment.put_entity(
  access_token: access_token,
  entity: {
    'CustomerID' => { 'value' => 'JOHNGOODPAYER' },
    'ApplicationDate' => { 'value' => '2025-05-6' },
    'PostPeriod' => { 'value' => '11-2025' },
    'Branch' => { 'value' => 'MAIN' },
    'PaymentMethod' => { 'value' => 'CASH' },
    'CashAccount' => { 'value' => 'CASHACCC' },
    'Hold' => { 'value' => true },
    'Applications' => [
      {
        'DocType' => { 'value' => 'Invoice' },
        'ReferenceNbr' => { 'value' => invoice_1['ReferenceNbr']['value'] },
        'AmountPaid' => { 'value' => 45.0 },
        'Apply' => { 'value' => true }
      }
    ]
  },
  logger: logger
)

MyobAcumatica::Api::Payment.put_entity(
  access_token: access_token,
  entity: {
    'id' => payment_45['id'],
    'Hold' => { 'value' => false }
  },
  logger: logger
)

MyobAcumatica::Api::Payment.release_payment(
  access_token: access_token,
  entity: { 'id' => payment_45['id'] },
  logger: logger
)

payment_55 = MyobAcumatica::Api::Payment.put_entity(
  access_token: access_token,
  entity: {
    'CustomerID' => { 'value' => 'JOHNGOODPAYER' },
    'CustomerLocationID' => { 'value' => 'MAIN' },
    'ApplicationDate' => { 'value' => '2025-05-6' },
    'PostPeriod' => { 'value' => '11-2025' },
    'Branch' => { 'value' => 'MAIN' },
    'PaymentMethod' => { 'value' => 'CASH' },
    'CashAccount' => { 'value' => 'CASHACCC' },
    'Hold' => { 'value' => false },
    'Applications' => [
      {
        'DocType' => { 'value' => 'Invoice' },
        'ReferenceNbr' => { 'value' => invoice_1['ReferenceNbr']['value'] },
        'AmountPaid' => { 'value' => 55.0 },
        'Apply' => { 'value' => true }
      }
    ]
  },
  logger: logger
)

MyobAcumatica::Api::Payment.invoke_action(
  access_token: access_token,
  action_name: 'ReleasePayment',
  entity: { 'id' => payment_55['id'] },
  logger: logger
)

payment_45_by_id = MyobAcumatica::Api::Payment.get_by_id(
  access_token: access_token,
  id: payment_45['id'],
  logger: logger
)

payment_55_by_keys = MyobAcumatica::Api::Payment.get_by_keys(
  access_token: access_token,
  keys: [payment_55['Type']['value'], payment_55['ReferenceNbr']['value']],
  logger: logger
)

payment_list = MyobAcumatica::Api::Payment.get_list(
  access_token: access_token,
  query_params: {
    '$filter' => "Type eq 'Payment'"
  },
  logger: logger
)

MyobAcumatica::Api::Payment.put_file(
  access_token: access_token,
  keys: [payment_45['Type']['value'], payment_45['ReferenceNbr']['value']],
  file_path: 'examples/dummy.pdf',
  logger: logger
)

# cc_pay = MyobAcumatica::Api::Payment.put_entity(
#   access_token: access_token,
#   entity: {
#     'Type' => { 'value' => 'Payment' },
#     'CustomerID' => { 'value' => customer['CustomerID'] },
#     'ApplicationDate' => { 'value' => '2025-05-6' },
#     'PostPeriod' => { 'value' => '11-2025' },
#     'Branch' => { 'value' => 'MAIN' },
#     'PaymentMethod' => { 'value' => 'CCARD' },
#     'CashAccount' => { 'value' => 'CASHACCOUNT' },
#     'Hold' => { 'value' => false }
#   },
#   logger: logger
# )

# MyobAcumatica::Api::Payment.card_operation(
#   access_token: access_token,
#   entity: {
#     'ReferenceNbr' => { 'value' => cc_pay['ReferenceNbr']['value'] }
#   },
#   parameters: {
#     'Operation' => { 'value' => 'Authorize' },
#     'Amount' => { 'value' => 60.0 }
#   },
#   logger: logger
# )

# MyobAcumatica::Api::Payment.capture_credit_card_payment(
#   access_token: access_token,
#   entity: {
#     'ReferenceNbr' => { 'value' => cc_pay['ReferenceNbr']['value'] }
#   },
#   parameters: {
#     'Amount' => { 'value' => 60.0 }
#   },
#   logger: logger
# )

# MyobAcumatica::Api::Payment.release_payment(
#   access_token: access_token,
#   entity: {
#     'ReferenceNbr' => { 'value' => cc_pay['ReferenceNbr']['value'] }
#   },
#   logger: logger
# )

# voidable = MyobAcumatica::Api::Payment.put_entity(
#   access_token: access_token,
#   entity: {
#     'Type' => { 'value' => 'Payment' },
#     'CustomerID' => { 'value' => customer['CustomerID'] },
#     'ApplicationDate' => { 'value' => Date.today.strftime('%Y-%m-%d') },
#     'PaymentMethod' => { 'value' => cash_method },
#     'CashAccount' => { 'value' => cash_account },
#     'Hold' => { 'value' => true }
#   },
#   logger: logger
# )

# MyobAcumatica::Api::Payment.void_payment(
#   access_token: access_token,
#   entity: { 'ReferenceNbr' => { 'value' => voidable['ReferenceNbr']['value'] } },
#   logger: logger
# )

# MyobAcumatica::Api::Payment.void_card_payment(
#   access_token: access_token,
#   entity: { 'ReferenceNbr' => { 'value' => cc_pay['ReferenceNbr']['value'] } },
#   logger: logger
# )

MyobAcumatica::Api::Payment.delete_by_keys(
  access_token: access_token,
  keys: [payment_55['Type']['value'], payment_55['ReferenceNbr']['value']],
  logger: logger
)

MyobAcumatica::Api::Payment.delete_by_id(
  access_token: access_token,
  id: payment_45['id'],
  logger: logger
)
