# Ruby library for the MYOB Acumatica API

A lightweight Ruby client for accessing the MYOB Acumatica REST API via OAuth2.

---

## Installation

Using Bundler:

```bash
bundle add myob_acumatica
```

Without Bundler:

```bash
gem install myob_acumatica
```

---

## Setup

Set the following environment variables in your host application:

```bash
MYOB_ACUMATICA_INSTANCE_NAME=your-instance.myob.com
MYOB_ACUMATICA_CLIENT_ID=your-client-id
MYOB_ACUMATICA_CLIENT_SECRET=your-client-secret
MYOB_ACUMATICA_REDIRECT_URI=http://localhost:4567/oauth2/callback
MYOB_ACUMATICA_SCOPE=api offline_access
MYOB_ACUMATICA_ENDPOINT_NAME=Default
MYOB_ACUMATICA_ENDPOINT_VERSION=22.200.001
```

---

## OAuth2 Flow

Get the authorization URL to initiate login:

```ruby
MyobAcumatica::OAuth2::Token.authorize_url
```

Exchange the code for an access token and a refresh token

```ruby
token = MyobAcumatica::OAuth2::Token.authorize(code: params[:code])
```

```ruby
{
  "access_token" => "...",
  "expires_in" => 3600,
  "token_type" => "Bearer",
  "refresh_token" => "...",
  "scope" => "api offline_access"
}
```

Refresh the access token when expired:

```ruby
token = MyobAcumatica::OAuth2::Token.refresh(refresh_token: token["refresh_token"])
```

---

## Customer Examples

Create or update a customer:

```ruby
MyobAcumatica::Api::Customer.put_entity(
  access_token: token["access_token"],
  entity: {
    'CustomerID' => { 'value' => 'JOHNGOOD' },
    'CustomerName' => { 'value' => 'John Good' },
    'CustomerClass' => { 'value' => 'CUSTDFT' }
  }
)
```

List customers:

```ruby
MyobAcumatica::Api::Customer.get_list(
  access_token: token["access_token"],
  query_params: { '$filter' => "Status eq 'Active'" }
)
```

Get customer by keys:

```ruby
MyobAcumatica::Api::Customer.get_by_keys(
  access_token: token["access_token"],
  keys: ['JOHNGOOD']
)
```

Delete a customer:

```ruby
MyobAcumatica::Api::Customer.delete_by_keys(
  access_token: token["access_token"],
  keys: ['JOHNGOOD']
)
```

---

## Invoice Examples

Create an invoice:

```ruby
MyobAcumatica::Api::Invoice.put_entity(
  access_token: token["access_token"],
  entity: {
    'CustomerID' => { 'value' => 'JOHNGOOD' },
    'Date' => { 'value' => '2025-06-06' },
    'Details' => [
      {
        'InventoryID' => { 'value' => 'CONSULTING' },
        'Quantity' => { 'value' => 2 },
        'UnitPrice' => { 'value' => 150.0 }
      }
    ]
  }
)
```

List invoices:

```ruby
MyobAcumatica::Api::Invoice.get_list(
  access_token: token["access_token"],
  query_params: {
    '$filter' => "Status eq 'Open'",
    '$top' => 10,
    '$select' => 'InvoiceNbr,CustomerID,Status,Date'
  }
)
```

Get invoice by ID:

```ruby
MyobAcumatica::Api::Invoice.get_by_id(
  access_token: token["access_token"],
  id: '00000000-0000-0000-0000-000000000000'
)
```

Delete an invoice:

```ruby
MyobAcumatica::Api::Invoice.delete_by_id(
  access_token: token["access_token"],
  id: '00000000-0000-0000-0000-000000000000'
)
```

---

## Documentation

See full API reference and usage examples:
➡️ https://www.rubydoc.info/gems/myob_acumatica

---

## Development

### 1. Clone the repo

```bash
git clone https://github.com/fast-programmer/myob_acumatica.git
cd myob_acumatica
bundle install
```

### 2. Create a `.env` file

```env
MYOB_ACUMATICA_INSTANCE_NAME=your-instance.myob.com
MYOB_ACUMATICA_CLIENT_ID=your-client-id
MYOB_ACUMATICA_CLIENT_SECRET=your-client-secret
MYOB_ACUMATICA_REDIRECT_URI=http://localhost:4567/oauth2/callback
MYOB_ACUMATICA_SCOPE=api offline_access
MYOB_ACUMATICA_ENDPOINT_NAME=Default
MYOB_ACUMATICA_ENDPOINT_VERSION=22.200.001
```

### 3. Run the Sinatra example app

This test app helps acquire an OAuth token and inspect customer data.

```bash
bundle exec ruby examples/app.rb
```

Visit in your browser:

- http://localhost:4567/oauth2/authorize — start login
- http://localhost:4567/oauth2/callback — receive tokens and fetch customer list

### 4. Open an interactive shell

```bash
bin/console
```

Try this command with your token:

```ruby
MyobAcumatica::Api::Customer.get_list(access_token: token["access_token"])
```

---

## Contributing

Bug reports and pull requests are welcome at:
https://github.com/fast-programmer/myob_acumatica

Please follow the code of conduct:
https://github.com/fast-programmer/myob_acumatica/blob/master/CODE_OF_CONDUCT.md

---

## License

MIT — see the LICENSE
https://opensource.org/licenses/MIT
