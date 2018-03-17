class Artist

attr_accessor :name
@@all = []


def initialize(name)
  @name = name
  @songs = []

end

def save
  @@all << self
end

def self.all
  @@all
end

def songs
  @songs
end

def add_song(song)
  @songs << song
end

def self.find_by_name(name)
  self.all.find do |artist|
    artist.name == name
  end
end

def self.find_or_create_by_name(artist)
  if !self.find_by_name(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  else
    self.find_by_name(artist)
  end
end

def print_songs
  songs.collect do |song|
    puts song.name 
  end
end






end
