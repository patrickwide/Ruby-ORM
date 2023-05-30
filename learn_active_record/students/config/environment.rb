require 'sqlite3'
require 'active_record'

# Establish the database connection
database_path = File.expand_path('../db/students.db', __dir__)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: database_path)

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql)
