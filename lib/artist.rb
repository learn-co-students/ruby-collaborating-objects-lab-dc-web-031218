class Artist
attr_accessor :name

attr_reader :songs

@@all = []

def initialize(name)
  @name = name
end

def songs
  Song.all.select{|x| x.artist == self}
end


def add_song(song)
  song.artist= self
end

def self.all
  @@all
end

def save
  self.class.all << self
  self
end

def self.find_or_create_by_name(query)
  all.none?{|x|x.name.include?(query)} ? Artist.new(query).save : all.find{|x|x.name == query}
end

def print_songs
  self.songs.each{|x| puts x.name}
end



end
