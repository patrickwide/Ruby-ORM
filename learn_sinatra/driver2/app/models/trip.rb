class Trip < ActiveRecord::Base
    belongs_to :customer
    belongs_to :car
end