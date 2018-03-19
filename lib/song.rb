class Song
  attr_accessor :name, :artist
  def initialize(name ="song_name")
    @name = name
  end

  def name=(name)
    @name = name
  end

  def self.name=(name)
    @name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(filename)
    filename = filename.split(" - ")
    song_name = filename[1]
    new_song = Song.new(song_name)
    new_song_artist = Artist.new(filename[0])
    new_song.artist = new_song_artist
    new_song.name = song_name
    new_song_artist.add_song(new_song)
    new_song
  end
end
