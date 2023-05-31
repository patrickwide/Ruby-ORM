require 'active_record'
require_relative '../config/environment'

class Student < ActiveRecord::Base
    validates :name, presence: true
end

