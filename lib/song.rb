class Song
  attr_accessor :name, :artist

  def self.all
    @@all ||= []
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.new_by_filename(filename)
    # creates a new instance of a song from the file that's passed in
    split = filename.split(" - ")
    artist = split[0]
    song = split[1]

    new_song = Song.new(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song
    # binding.pry
  end

end
