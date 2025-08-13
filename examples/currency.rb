# frozen_string_literal: true

require 'json'
require 'logger'
require 'date'
require 'dotenv/load'
require 'myob_acumatica'

access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Currency.get_ad_hoc_schema(
  access_token: access_token,
  logger: logger
)

currency1 = MyobAcumatica::Api::Currency.put_entity(
  access_token: access_token,
  entity: {
    'CurrencyID' => { 'value' => 'XCU1' },
    'Description' => { 'value' => 'Example Currency 1' }
  },
  logger: logger
)

currency2 = MyobAcumatica::Api::Currency.put_entity(
  access_token: access_token,
  entity: {
    'CurrencyID' => { 'value' => 'XCU2' },
    'Description' => { 'value' => 'Example Currency 2' }
  },
  logger: logger
)

puts "Created XCU1 id=#{currency1['id']}"
puts "Created XCU2 id=#{currency2['id']}"

currency1 = MyobAcumatica::Api::Currency.put_entity(
  access_token: access_token,
  entity: {
    'id' => currency1['id'],
    'Description' => { 'value' => 'Example Currency 1 (updated)' }
  },
  logger: logger
)
puts 'Updated XCU1 description'

by_id = MyobAcumatica::Api::Currency.get_by_id(
  access_token: access_token,
  id: currency1['id'],
  logger: logger
)
puts "Fetched by id: #{by_id['CurrencyID']&.dig('value')}"

by_keys = MyobAcumatica::Api::Currency.get_by_keys(
  access_token: access_token,
  keys: ['AMD'],
  logger: logger
)
puts "Fetched by keys: #{by_keys['CurrencyID']&.dig('value')}"

list = MyobAcumatica::Api::Currency.get_list(
  access_token: access_token,
  query_params: { '$select' => 'CurrencyID,Description', '$top' => 5 },
  logger: logger
)
puts "Listed #{list.size} currency record(s)"

# MyobAcumatica::Api::Currency.put_file(
#   access_token: access_token,
#   keys: ['AMD'],
#   file_path: 'examples/dummy.pdf',
#   logger: logger
# )
# puts 'Attached file to AMD'

# MyobAcumatica::Api::Currency.invoke_action(
#   access_token: access_token,
#   action_name: 'CustomAction',
#   entity: { 'id' => currency1['id'] },
#   logger: logger
# )
# puts 'Invoked action on XCU1'

# MyobAcumatica::Api::Currency.delete_by_keys(
#   access_token: access_token,
#   keys: ['XCU2'],
#   logger: logger
# )
# puts 'Deleted XCU2 by keys'

MyobAcumatica::Api::Currency.delete_by_id(
  access_token: access_token,
  id: currency1['id'],
  logger: logger
)
puts 'Deleted XCU1 by id'
