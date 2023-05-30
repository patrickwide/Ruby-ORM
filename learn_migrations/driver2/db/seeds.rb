# Create drivers
driver1 = Driver.create(driver_name: 'John Doe', phone_no: '1234567890', license: 'ABC123', status: 'active')
driver2 = Driver.create(driver_name: 'Jane Smith', phone_no: '9876543210', license: 'XYZ456', status: 'active')

# Create cars
car1 = Car.create(driver: driver1, numberplate: 'ABC123', color: 'Red', model: 'Toyota', no_of_seats: 4)
car2 = Car.create(driver: driver2, numberplate: 'XYZ456', color: 'Blue', model: 'Honda', no_of_seats: 5)

# Create customers
customer1 = Customer.create(customer_name: 'Alice Johnson', phone_no: '5551112222')
customer2 = Customer.create(customer_name: 'Bob Thompson', phone_no: '9998887777')

# Create trips
trip1 = Trip.create(customer: customer1, car: car1, destination: 'Airport', pick_up_location: 'Home', price: 25.0, total_passengers: 2)
trip2 = Trip.create(customer: customer2, car: car2, destination: 'Shopping Mall', pick_up_location: 'Office', price: 15.0, total_passengers: 1)

# Print success message
puts 'Seeding complete!'
