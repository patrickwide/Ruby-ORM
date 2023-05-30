require 'active_record'
require_relative '../config/environment'

require 'pry'

class Student < ActiveRecord::Base
    validates :name, presence: true
end

binding.pry