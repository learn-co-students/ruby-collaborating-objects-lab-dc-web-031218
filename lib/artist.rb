class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song
  end

  def songs
    @songs
  end

  def save
    self.class.all << self
    self
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
    # binding.pry
    if Artist.all.find{|artist| artist.name == name}.nil?
      artist = Artist.new(name).save
    else
      Artist.all.find{|artist| artist.name == name}
    end
  end

  def print_songs
    @songs.each{|song| puts song.name}
  end

end
