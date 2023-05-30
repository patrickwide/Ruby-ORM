# Establish the database connection
require_relative '../config/environment'

class Song
    attr_accessor :id, :name, :album

    def initialize(id: nil, name:, album:)
        @id = id
        @name = name
        @album = album
    end

    def self.create_table
        create_table_sql = <<-SQL
            CREATE TABLE IF NOT EXISTS songs (
                id INTEGER PRIMARY KEY,
                name TEXT,
                album TEXT
            );
        SQL

        $db.execute(create_table_sql)
    end

    def save
        insert_sql = <<-SQL
            INSERT INTO songs (name, album)
            VALUES (?, ?);
        SQL

        $db.execute(insert_sql, @name, @album)
    end

    def self.all
        select_all_sql = <<-SQL
            SELECT * FROM songs;
        SQL

        songs_data = $db.execute(select_all_sql)
        songs_data.map { |song_data| Song.new(id: song_data[0], name: song_data[1], album: song_data[2]) }
    end

    def self.find_by_id(id)
        select_sql = <<-SQL
            SELECT * FROM songs WHERE id =?;
        SQL

        song_data = $db.execute(select_sql, id).first
        Song.new(id: song_data[0], name: song_data[1], album: song_data[2]) if song_data
    end

end

# # Create the songs table
# Song.create_table

# Example usage:
# song1 = Song.new(name: "My Song 1", album: "My Album 1")
# song1.save
# song2 = Song.new(name: "My Song 3", album: "My Album 1")
# song2.save
# song3 = Song.new(name: "My Song 3", album: "My Album 1")
# song3.save
# song4 = Song.new(name: "My Song 4", album: "My Album 1")
# song4.save
# song5 = Song.new(name: "My Song 5", album: "My Album 2")
# song5.save
# song6 = Song.new(name: "My Song 6", album: "My Album 2")
# song6.save
# song7 = Song.new(name: "My Song 7", album: "My Album 2")
# song7.save
# song8 = Song.new(name: "My Song 8", album: "My Album 2")
# song8.save

# Retrieve all songs
# all_songs = Song.all
# all_songs.each do |song|
#     puts "Song id: #{song.id} - name: #{song.name} - album: #{song.album}"
# end

# song = Song.find_by_id(1)
# puts "Song id: #{song.id} - name: #{song.name} - album: #{song.album}" if song
