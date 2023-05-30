require 'active_record'
require_relative '../config/environment'
require 'pry'

class Song < ActiveRecord::Base
end

binding.pry