require 'yaml'
require 'active_record'

# Load the database configuration from YAML file
config = YAML.load_file(File.expand_path('database.yml', __dir__))

# Establish the connection using the configuration for the current environment
ActiveRecord::Base.establish_connection(config[ENV['RACK_ENV'] || 'development'])

# Create a table if it doesn't exist
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
    email TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql)