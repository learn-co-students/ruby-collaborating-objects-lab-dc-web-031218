require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end



  def self.new_by_filename(filename)
    # binding.pry
    file = filename.split(" - ")
    artist_name = file[0]
    song_title = file[1]

    new_song = Song.new(song_title)
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist = new_artist
    new_artist.add_song(song_title)
    new_song.artist.name = artist_name

    new_song
    # binding.pry
  end
end
