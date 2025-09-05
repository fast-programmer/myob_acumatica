# Myob Acumatica

A simple to use Ruby library for integrating with the MYOB Acumatica REST API via OAuth2.

## Installation

Using Bundler:

```bash
bundle add myob_acumatica
```

Without Bundler:

```bash
gem install myob_acumatica
```

## Configuration

Provide configuration via **environment variables** or **explicitly per call**.

**Note**: explicit arguments override environment variables.

### Environment variables

```env
MYOB_ACUMATICA_INSTANCE_NAME=example.myobadvanced.com
MYOB_ACUMATICA_CLIENT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx@Company
MYOB_ACUMATICA_CLIENT_SECRET=xxxxxxxxxx_x_xxxxxxxxx
MYOB_ACUMATICA_REDIRECT_URI=http://localhost:4567/oauth2/callback
MYOB_ACUMATICA_SCOPE=api offline_access
MYOB_ACUMATICA_ENDPOINT_NAME=Default
MYOB_ACUMATICA_ENDPOINT_VERSION=20.200.001
```

```ruby
MyobAcumatica::Api::Customer.get_list(
  access_token: token["access_token"],
  query_params: { '$filter' => "Status eq 'Active'" }
)
```

### Explicit arguments

```ruby
MyobAcumatica::Api::Customer.get_list(
  access_token: token["access_token"],
  instance_name: "example.myobadvanced.com",
  endpoint_name: "Default",
  endpoint_version: "20.200.001",
  query_params: { '$filter' => "Status eq 'Active'" }
)
```

## Authorization

Allow a client application to obtain an access token on behalf of a user, using an authorization code granted by the user after consent.

### Generate authorization request URL

Redirect the user to the authorization endpoint to initiate the consent flow.

```ruby
MyobAcumatica::OAuth2::Token.authorize_url(
  instance_name: 'example.myobadvanced.com',
  redirect_uri: 'https://example.myobadvanced.com/oauth2/callback',
  client_id: 'abc123',
  scope: 'api offline_access'
)
```

This returns a URL like:

```
https://example.myobadvanced.com/identity/connect/authorize?response_type=code&client_id=abc123&redirect_uri=https%3A%2F%2Fexample.myobadvanced.com%2Foauth2%2Fcallback&scope=api+offline_access
```

Send users to this URL to initiate the authorization code grant flow.

### Exchange authorization code for access token

After the user grants consent, Acumatica will redirect to your callback URL with a `code` parameter. Exchange it for an access token:

```ruby
token = MyobAcumatica::OAuth2::Token.authorize(
  code: params[:code],
  instance_name: 'example.myobadvanced.com',
  redirect_uri: 'https://example.myobadvanced.com/oauth2/callback',
  client_id: 'abc123',
  client_secret: 'secret123'
)
```

Example response:

```ruby
{
  "access_token" => "...",
  "expires_in" => 3600,
  "token_type" => "Bearer",
  "refresh_token" => "...",
  "scope" => "api offline_access"
}
```

### Refresh access token

When the access token expires, use the `refresh_token` to obtain a new one without prompting the user again.

```ruby
token = MyobAcumatica::OAuth2::Token.refresh(
  refresh_token: token["refresh_token"],
  instance_name: 'example.myobadvanced.com',
  client_id: 'abc123',
  client_secret: 'secret123'
)
```

This returns a fresh token object with the same structure.


## Usage

### Customers

Create or update a customer:

```ruby
MyobAcumatica::Api::Customer.put_entity(
  access_token: token['access_token'],
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
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
  access_token: token['access_token'],
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
  query_params: { '$filter' => "Status eq 'Active'" }
)
```

Get customer by keys:

```ruby
MyobAcumatica::Api::Customer.get_by_keys(
  access_token: token['access_token'],
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
  keys: ['JOHNGOOD']
)
```

Delete a customer:

```ruby
MyobAcumatica::Api::Customer.delete_by_keys(
  access_token: token['access_token'],
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
  keys: ['JOHNGOOD']
)
```

### Invoices

Create an invoice:

```ruby
MyobAcumatica::Api::Invoice.put_entity(
  access_token: token["access_token"],
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
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
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
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
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
  id: '00000000-0000-0000-0000-000000000000'
)
```

Delete an invoice:

```ruby
MyobAcumatica::Api::Invoice.delete_by_id(
  access_token: token["access_token"],
  instance_name: 'example.myobadvanced.com',
  endpoint_name: 'Default',
  endpoint_version: '20.200.001',
  id: '00000000-0000-0000-0000-000000000000'
)
```

## Documentation

See full API reference and usage examples: [rubydoc.info/gems/myob_acumatica](https://www.rubydoc.info/gems/myob_acumatica)

## Development

### 1. Clone the repo

```bash
git clone https://github.com/fast-programmer/myob_acumatica.git
cd myob_acumatica
bundle install
```

### 2. Create a `.env` file

```env
MYOB_ACUMATICA_INSTANCE_NAME=example.myob.com
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

## Contributing

Bug reports and pull requests are welcome at:
https://github.com/fast-programmer/myob_acumatica

Please follow the code of conduct:
https://github.com/fast-programmer/myob_acumatica/blob/master/CODE_OF_CONDUCT.md

## License

MIT — see the LICENSE
https://opensource.org/licenses/MIT
