require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'controllers/drivers_controller'
require_relative 'controllers/cars_controller'
require_relative 'controllers/customers_controller'
require_relative 'controllers/trips_controller'
require_relative 'models/driver'
require_relative 'models/car'
require_relative 'models/customer'
require_relative 'models/trip'

class MyApp < Sinatra::Base
  use DriversController
  use CarsController
  use CustomersController
  use TripsController

end

MyApp.run!
