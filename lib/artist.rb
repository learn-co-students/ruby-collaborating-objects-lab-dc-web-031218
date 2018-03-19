class Artist
  attr_accessor :name

  def self.all
    @@all ||= []
  end

  def initialize(name)
    @name = name
    @songs = []
    # save
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    # adds the artist instance to the @@all class variable
    self.class.all << self
  end

  def self.find_by_name(artist_name)
    result = nil
    self.all.each do |artist|
      if artist.name == artist_name
        result = artist
      end
    end

    result
  end

  def self.find_or_create_by_name(artist_name)
    # finds or creates an artist by name maintaining uniqueness of objects by name property

    if self.find_by_name(artist_name)
      self.find_by_name(artist_name)
    else
      # create artist by name
      new_artist = Artist.new(artist_name)
      new_artist.save
      new_artist

    end

  end

end
