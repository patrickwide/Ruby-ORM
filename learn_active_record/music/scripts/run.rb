require_relative '../config/environment'
require_relative '../models/song'

# Your code to create and save a song
song = Song.new(name: "My Song 1", album: "My Album 1")
song.save
