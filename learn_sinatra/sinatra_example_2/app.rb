require 'sinatra'
require 'json'

class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def to_json
    { name: name, email: email }.to_json
  end
end

class MyApp < Sinatra::Application
  # Note: not recommended for production
  # Store users in memory for simplicity
  @@users = []

  get '/' do
    { message: 'Hello, World!' }.to_json
  end

  post '/users' do
    # Retrieve data from the request body (assumes JSON payload)
    data = JSON.parse(request.body.read)
    name = data['name']
    email = data['email']

    # Validate the data
    if name.nil? || email.nil?
      status 400 # Bad Request
      return { error: 'Name and email are required fields' }.to_json
    end

    # Create a new user object
    user = User.new(name, email)

    # Save the user to the storage (in this case, an array)
    @@users << user

    status 201 # Created
    { message: 'User created successfully' }.to_json
  end

  get '/users/:id' do |id|
    # Find the user by ID
    user = @@users.find { |u| u.object_id == id.to_i }

    # Handle user not found
    if user.nil?
      status 404 # Not Found
      return { error: "User with ID #{id} not found" }.to_json
    end

    user.to_json
  end

  patch '/users/:id' do |id|
    # Retrieve data from the request body (assumes JSON payload)
    data = JSON.parse(request.body.read)
    name = data['name']

    # Find the user by ID
    user = @@users.find { |u| u.object_id == id.to_i }

    # Handle user not found
    if user.nil?
      status 404 # Not Found
      return { error: "User with ID #{id} not found" }.to_json
    end

    # Update the user's name
    user.name = name

    { message: 'User updated successfully' }.to_json
  end

  delete '/users/:id' do |id|
    # Find the index of the user by ID
    index = @@users.find_index { |u| u.object_id == id.to_i }

    # Handle user not found
    if index.nil?
      status 404 # Not Found
      return { error: "User with ID #{id} not found" }.to_json
    end

    # Remove the user from the storage
    @@users.delete_at(index)

    { message: 'User deleted successfully' }.to_json
  end
end

MyApp.run!
