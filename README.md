# Myob Acumatica

Access the MYOB Acumatica HTTP API via Ruby

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add myob_acumatica

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install myob_acumatica

## Usage

## 1. Get an access token using the OAuth2 Authorization Code Grant Flow

### i. Generate Authorization URL

To initiate the OAuth2 flow, generate an authorization URL:

```ruby
MyobAcumatica::OAuth2::Token.authorize_url(
  instance_host: ...,
  client_id: ...,
  redirect_uri: ...,
  scope: 'api offline'
)

=> https://{instance_host}/identity/connect/authorize?response_type=code&client_id={client_id}&redirect_uri={redirect_uri}&scope=api+offline_access
```

Then redirect users to this URL to start the authorization process.

### ii. Exchange the authorization code for an access token

After the user has authorized the application, they will be redirected back to your application with an authorization code.

Use this code to request an access token:

```ruby
MyobAcumatica::OAuth2::Token.authorize(
  instance_host: ...,
  client_id: ...,
  client_secret: ...,
  code: params['code'],
  redirect_uri: ...,
)

=> {
  "access_token" => "abc",
  "expires_in" => 3600,
  "token_type" => "Bearer",
  "refresh_token" => "def",
  "scope" => "api offline_access"
}
```


### iii. Refresh the access token using the refresh token

If the access token expires, you can use the refresh token received during the token exchange to obtain a new access token:

```ruby
MyobAcumatica::OAuth2::Token.refresh(
  instance_host: ENV['INSTANCE_HOST'],
  client_id: ENV['CLIENT_ID'],
  client_secret: ENV['CLIENT_SECRET'],
  refresh_token: params[:refresh_token],
  logger: Logger.new($stdout)
)

=> {"access_token":"ghi",expires_in":3600,"token_type":"Bearer","refresh_token":"jkl","scope":"api offline_access"}
```

## 2. Hit the MYOB Accumatica API

```ruby
customers = MyobAcumatica::Api::Customer.get_list(
  access_token: token['access_token'],
  instance_host: ...,
  endpoint_name: 'Default',
  endpoint_version: ...,
  query_params: { filter: 'IsActive eq true' },
  logger: Logger.new($stdout)
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fast-programmer/myob_acumatica. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/fast-programmer/myob_acumatica/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MyobAcumatica project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fast-programmer/myob_acumatica/blob/master/CODE_OF_CONDUCT.md).
