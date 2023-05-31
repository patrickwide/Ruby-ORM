require_relative '../models/car'

class CarsController < Sinatra::Base
  get '/cars' do
    cars = Car.all
    cars.map { |car| car.to_json }.to_json
  end

  post '/cars' do
    request_body = JSON.parse(request.body.read)
    car = Car.create(request_body)
    car.to_json
  end

  get '/cars/:id' do |id|
    car = Car.find_by(id: id)
    if car
      car.to_json
    else
      status 404
      { error: "Car not found with ID #{id}" }.to_json
    end
  end

  patch '/cars/:id' do |id|
    car = Car.find_by(id: id)
    if car
      request_body = JSON.parse(request.body.read)
      car.update(request_body)
      car.to_json
    else
      status 404
      { error: "Car not found with ID #{id}" }.to_json
    end
  end

  delete '/cars/:id' do |id|
    car = Car.find_by(id: id)
    if car
      car.destroy
      { message: 'Car deleted successfully' }.to_json
    else
      status 404
      { error: "Car not found with ID #{id}" }.to_json
    end
  end
end
