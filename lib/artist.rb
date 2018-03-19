class Artist
  attr_accessor :name
  @@all = []

  def initialize(name="artist")
    @name = name
    @songs = []
  end

  def self.name=(name)
    name
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
    @songs
  end

  def self.all
    @@all
  end

  def all
    @@all
  end

  def save
    @@all << self
    @@all
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.create_by_name(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.find_by_name(name)
    @@all.find do |artist|
        artist.name == name
      end
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
end
