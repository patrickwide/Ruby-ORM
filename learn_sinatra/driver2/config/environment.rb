# Set the default RACK_ENV to 'development' if it's not already set
ENV['RACK_ENV'] ||= 'development'

# Load the necessary gems and dependencies based on the RACK_ENV
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# Require the models for each respective table
require_relative "../app/models/car"
require_relative "../app/models/driver"
require_relative "../app/models/customer"
require_relative "../app/models/trip"
