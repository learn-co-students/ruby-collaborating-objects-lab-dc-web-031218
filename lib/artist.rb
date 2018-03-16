class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    if !@@all.include?(self)
      @@all << self
    end
    # binding.pry
  end


  def add_song(song)
    self.songs << song
    self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each{|s| puts s.name}
  end

  def self.find_or_create_by_name(lookFor)
    @@all.each {|artist| return artist if artist.name == lookFor}
    Artist.new(lookFor)
    #binding.pry
  end


end
