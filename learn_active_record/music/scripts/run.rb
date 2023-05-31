require_relative '../config/environment'
require_relative '../models/song'
require 'pry'

# Your code to create and save a song
Song.create(name: "My Song 1", album: "My Album 1")
Song.create(name: "My Song 2", album: "My Album 1")
Song.create(name: "My Song 3", album: "My Album 1")
Song.create(name: "My Song 4", album: "My Album 1")
Song.create(name: "My Song 5", album: "My Album 2")
Song.create(name: "My Song 6", album: "My Album 2")
Song.create(name: "My Song 7", album: "My Album 2")
Song.create(name: "My Song 8", album: "My Album 2")

binding.pry