class Artist
	@@all = []
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def self.all 
		@@all
	end

	def songs
		Song.all.select{|song| song.artist == self}
	end

	def add_song(song_obj)
		song_obj.artist = self
	end

	def save
		self.class.all << self
	end

	def self.find_or_create_by_name(name)
		if !@@all.any?{|artist| artist.name == name}
	 		temp = Artist.new(name)
	 		@@all << temp
	 		temp
	 	else
	 		return @@all.detect{|artist| artist.name == name}
		end
	end

	def print_songs
		self.songs.each{|song| puts song.name}
	end

end