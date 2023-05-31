class Car < ActiveRecord::Base
    belongs_to :driver

    def driver_name
        driver&.driver_name
    end
end