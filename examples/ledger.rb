# frozen_string_literal: true

require 'json'
require 'logger'
require 'dotenv/load'

require 'myob_acumatica'

access_token = ENV['MYOB_ACUMATICA_ACCESS_TOKEN']
logger = Logger.new($stdout)

MyobAcumatica::Api::Ledger.get_ad_hoc_schema(
  access_token: access_token,
  logger: logger
)

ledger1 = MyobAcumatica::Api::Ledger.put_entity(
  access_token: access_token,
  entity: {
    'LedgerID' => { 'value' => 'LEDGER-ACTUAL' },
    'Description' => { 'value' => 'Actuals Ledger' },
    'Active' => { 'value' => true }
  },
  logger: logger
)

ledger1 = MyobAcumatica::Api::Ledger.put_entity(
  access_token: access_token,
  entity: {
    'LedgerID' => { 'value' => ledger1['LedgerID']['value'] },
    'Description' => { 'value' => 'Actuals Ledger (Updated)' }
  },
  logger: logger
)

ledger1 = MyobAcumatica::Api::Ledger.get_by_keys(
  access_token: access_token,
  keys: [ledger1['LedgerID']['value']],
  logger: logger
)

MyobAcumatica::Api::Ledger.put_file(
  access_token: access_token,
  keys: [ledger1['LedgerID']['value']],
  file_path: 'examples/dummy.pdf',
  logger: logger
)

MyobAcumatica::Api::Ledger.get_by_id(
  access_token: access_token,
  id: ledger1['id'],
  logger: logger
)

MyobAcumatica::Api::Ledger.get_list(
  access_token: access_token,
  logger: logger
)

MyobAcumatica::Api::Ledger.delete_by_id(
  access_token: access_token,
  id: ledger1['id'],
  logger: logger
)

ledger2 = MyobAcumatica::Api::Ledger.put_entity(
  access_token: access_token,
  entity: {
    'LedgerID' => { 'value' => 'LEDGER-BUDGET' },
    'Description' => { 'value' => 'Budget Ledger' },
    'Active' => { 'value' => false }
  },
  logger: logger
)

MyobAcumatica::Api::Ledger.delete_by_keys(
  access_token: access_token,
  keys: [ledger2['LedgerID']['value']],
  logger: logger
)

# Example: invoke a custom action (uncomment and adjust to your action)
# MyobAcumatica::Api::Ledger.invoke_action(
#   access_token: access_token,
#   action_name: 'RebuildBalances',
#   entity: { 'LedgerID' => { 'value' => 'LEDGER-ACTUAL' } },
#   parameters: { 'FromPeriod' => { 'value' => '2024-01' } },
#   logger: logger
# )
