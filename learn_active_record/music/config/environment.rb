require 'sqlite3'
require 'active_record'

# Establish the database connection
database_path = File.expand_path('../db/music.db', __dir__)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: database_path)
