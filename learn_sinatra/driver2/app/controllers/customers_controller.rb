require_relative '../models/customer'

class CustomersController < Sinatra::Base
  get '/customers' do
    customers = Customer.all
    customers.map { |customer| customer.to_json }.to_json
  end

  post '/customers' do
    request_body = JSON.parse(request.body.read)
    customer = Customer.create(request_body)
    customer.to_json
  end

  get '/customers/:id' do |id|
    customer = Customer.find_by(id: id)
    if customer
      customer.to_json
    else
      status 404
      { error: "Customer not found with ID #{id}" }.to_json
    end
  end

  patch '/customers/:id' do |id|
    customer = Customer.find_by(id: id)
    if customer
      request_body = JSON.parse(request.body.read)
      customer.update(request_body)
      customer.to_json
    else
      status 404
      { error: "Customer not found with ID #{id}" }.to_json
    end
  end

  delete '/customers/:id' do |id|
    customer = Customer.find_by(id: id)
    if customer
      customer.destroy
      { message: 'Customer deleted successfully' }.to_json
    else
      status 404
      { error: "Customer not found with ID #{id}" }.to_json
    end
  end
end
