require_relative '../models/driver'

class DriversController < Sinatra::Base
  get '/drivers' do
    drivers = Driver.all
    drivers.map { |driver| driver.to_json }.to_json
  end

  post '/drivers' do
    request_body = JSON.parse(request.body.read)
    driver = Driver.create(request_body)
    driver.to_json
  end

  get '/drivers/:id' do |id|
    driver = Driver.find_by(id: id)
    if driver
      driver.to_json
    else
      status 404
      { error: "Driver not found with ID #{id}" }.to_json
    end
  end

  patch '/drivers/:id' do |id|
    driver = Driver.find_by(id: id)
    if driver
      request_body = JSON.parse(request.body.read)
      driver.update(request_body)
      driver.to_json
    else
      status 404
      { error: "Driver not found with ID #{id}" }.to_json
    end
  end

  delete '/drivers/:id' do |id|
    driver = Driver.find_by(id: id)
    if driver
      driver.destroy
      { message: 'Driver deleted successfully' }.to_json
    else
      status 404
      { error: "Driver not found with ID #{id}" }.to_json
    end
  end
end
