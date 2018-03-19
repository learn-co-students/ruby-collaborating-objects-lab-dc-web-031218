class Song
	@@all = []
	attr_accessor :artist, :name, :genre

	def initialize(name, artist = nil, genre = nil)
		@name = name
		@artist = artist
		@genre = genre
		self.class.all << self
	end

	def self.all
		@@all
	end

	def self.new_by_filename(filename)
		temp = filename.split(" - ")
		temp[2].slice! ".mp3"

		#temp[0] is artist, [1] = name, [2] = genre
		song = Song.new(temp[1])
		artist = Artist.find_or_create_by_name(temp[0])
		song.artist = artist
		song.genre = temp[2]
		song
	end
end