IEXClient = IEX::Api::Client.new(
  publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
  endpoint: 'https://cloud.iexapis.com/v1'
)