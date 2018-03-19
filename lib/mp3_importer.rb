require 'pry'
require_relative './artist.rb'
require_relative './song.rb'

class MP3Importer
	attr_accessor :path

	def initialize(path)
		@path = path
	end

	#Loads all the mp3 files in the path directory
	def files
		song_arr = Dir.entries(path)
		song_arr.delete_if{|str| !str.end_with? ".mp3"}
	end


	#imports the files into the library by creating songs from a file name
	def import
		self.files.each do |file|
			# binding.pry
			temp = file.split(" - ")
			temp[2].slice! ".mp3"

			#temp[0] is artist, [1] = name, [2] = genre
			song = Song.new(temp[1])
			artist = Artist.find_or_create_by_name(temp[0])
			song.artist = artist
			song.genre = temp[2]
		end

	end

end

 # test_path = "./spec/fixtures/mp3s"
 # music_importer = MP3Importer.new(test_path)
 # binding.pry
 # music_importer.import

# binding.pry