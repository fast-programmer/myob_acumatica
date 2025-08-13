# frozen_string_literal: true

require 'json'
require 'logger'
require 'date'
require 'dotenv/load'
require 'myob_acumatica'

access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Tax.get_ad_hoc_schema(
  access_token: access_token,
  logger: logger
)

gst = MyobAcumatica::Api::Tax.put_entity(
  access_token: access_token,
  entity: {
    'TaxID' => { 'value' => 'GST' },
    'Description' => { 'value' => 'Goods and Services Tax' },
    'TaxType' => { 'value' => 'Sales' },
    'CalculateOn' => { 'value' => 'Exclusive Document-Level' },
    'TaxAgency' => { 'value' => 'ATO' },
    'TaxPayableAccount' => { 'value' => '2200' },
    'TaxPayableSubaccount' => { 'value' => '000-000' }
  },
  logger: logger
)

vat = MyobAcumatica::Api::Tax.put_entity(
  access_token: access_token,
  entity: {
    'TaxID' => { 'value' => 'VAT20' },
    'Description' => { 'value' => 'Value Added Tax 20%' },
    'TaxType' => { 'value' => 'Sales' },
    'CalculateOn' => { 'value' => 'Exclusive Document-Level' },
    'TaxAgency' => { 'value' => 'ATO' },
    'TaxPayableAccount' => { 'value' => '2200' },
    'TaxPayableSubaccount' => { 'value' => '000-000' }
  },
  logger: logger
)

puts "Created GST with id=#{gst['id']}"
puts "Created VAT20 with id=#{vat['id']}"

gst_by_keys = MyobAcumatica::Api::Tax.get_by_keys(
  access_token: access_token,
  keys: ['GST'],
  logger: logger
)
puts "Fetched by keys: #{gst_by_keys['TaxID']&.dig('value')}"

gst_by_id = MyobAcumatica::Api::Tax.get_by_id(
  access_token: access_token,
  id: gst['id'],
  logger: logger
)
puts "Fetched by id: #{gst_by_id['TaxID']&.dig('value')}"

list = MyobAcumatica::Api::Tax.get_list(
  access_token: access_token,
  query_params: { '$filter' => "TaxType eq 'Sales'", '$top' => 5 },
  logger: logger
)
puts "Listed #{list.size} tax record(s)"

gst = MyobAcumatica::Api::Tax.put_entity(
  access_token: access_token,
  entity: {
    'id' => gst['id'],
    'Description' => { 'value' => 'GST (updated desc)' }
  },
  logger: logger
)
puts 'Updated GST description'

MyobAcumatica::Api::Tax.put_file(
  access_token: access_token,
  keys: ['GST'],
  file_path: 'examples/dummy.pdf',
  logger: logger
)
puts 'Attached file to GST'

MyobAcumatica::Api::Tax.delete_by_keys(
  access_token: access_token,
  keys: ['VAT20'],
  logger: logger
)
puts 'Deleted VAT20 by keys'

MyobAcumatica::Api::Tax.delete_by_id(
  access_token: access_token,
  id: gst['id'],
  logger: logger
)
puts 'Deleted GST by id'
