# Establish the database connection
require_relative '../config/environment'

class User
  attr_accessor :id, :name, :email

  def initialize(id: nil, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create_table
    create_table_sql = <<-SQL
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT
      );
    SQL
    
    $db.execute(create_table_sql)
  end

  def save
    insert_sql = <<-SQL
      INSERT INTO users (name, email)
      VALUES (?, ?);
    SQL

    $db.execute(insert_sql, @name, @email)
  end

  def self.all
    select_all_sql = <<-SQL
      SELECT * FROM users;
    SQL

    users_data = $db.execute(select_all_sql)
    users_data.map { |user_data| User.new(id: user_data[0], name: user_data[1], email: user_data[2]) }
  end

  def self.find_by_id(id)
    select_sql = <<-SQL
      SELECT * FROM users WHERE id = ?;
    SQL

    user_data = $db.execute(select_sql, id).first
    User.new(id: user_data[0], name: user_data[1], email: user_data[2]) if user_data
  end
end

# Create the users table
User.create_table

# Example usage:
user1 = User.new(name: "John Doe", email: "john@example.com")
user1.save

user2 = User.new(name: "Jane Smith", email: "jane@example.com")
user2.save

# Retrieve all users
all_users = User.all
all_users.each do |user|
  puts "#{user.name} - #{user.email}"
end

# Find a user by ID
user = User.find_by_id(1)
puts user.name if user
