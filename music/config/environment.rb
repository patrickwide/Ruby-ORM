require 'sqlite3'

# Establish the database connection
database_path = File.expand_path('../db/music.db', __dir__)
$db = SQLite3::Database.new(database_path)
