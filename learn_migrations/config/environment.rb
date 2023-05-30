require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require './app'  # assuming your Sinatra application file is named app.rb

# Database configuration
ActiveRecord::Base.establish_connection(
  YAML.load_file('config/database.yml')[ENV['RACK_ENV']]
)
