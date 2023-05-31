require 'rack'

# Rack application
app = proc do |env|
  # Create the response
  status = 200
  headers = { 'Content-Type' => 'text/plain' }
  body = ['Hello, Rack!']

  # Return the response
  [status, headers, body]
end

# Rackup the application
run app

# Run this terminal => rackup config.ru
