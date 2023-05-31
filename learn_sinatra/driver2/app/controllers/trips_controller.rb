require_relative '../models/trip'

class TripsController < Sinatra::Base
  get '/trips' do
    trips = Trip.all
    trips.map { |trip| trip.to_json }.to_json
  end

  post '/trips' do
    request_body = JSON.parse(request.body.read)
    trip = Trip.create(request_body)
    trip.to_json
  end

  get '/trips/:id' do |id|
    trip = Trip.find_by(id: id)
    if trip
      trip.to_json
    else
      status 404
      { error: "Trip not found with ID #{id}" }.to_json
    end
  end

  patch '/trips/:id' do |id|
    trip = Trip.find_by(id: id)
    if trip
      request_body = JSON.parse(request.body.read)
      trip.update(request_body)
      trip.to_json
    else
      status 404
      { error: "Trip not found with ID #{id}" }.to_json
    end
  end

  delete '/trips/:id' do |id|
    trip = Trip.find_by(id: id)
    if trip
      trip.destroy
      { message: 'Trip deleted successfully' }.to_json
    else
      status 404
      { error: "Trip not found with ID #{id}" }.to_json
    end
  end
end
