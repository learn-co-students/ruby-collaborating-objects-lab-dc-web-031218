class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
      filename = file.split(" - ")
      song_name = filename[1]
      artist_name = filename[0]

      artist = Artist.find_or_create_by_name(artist_name)
      song = self.new(song_name)
      song.artist = artist

      song

  end

end
