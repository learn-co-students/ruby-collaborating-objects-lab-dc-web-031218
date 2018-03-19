require 'pry'
class Artist
  attr_accessor :name

  def self.all
    @@all ||= []
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    self.class.all << self
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  def self.find_by_name(name)
    self.all.find do |artist|
      artist_name = artist.name
      artist_name == name
    end
  end

  def self.create_by_name(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end
end
