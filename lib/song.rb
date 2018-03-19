require 'pry'
class Song
  attr_accessor :name, :artist
  # attr_reader :new_song

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    parts = file_name.split("-").map do |s|
      s.strip
    end
    artist_name = parts.first
    song_name = parts[1]
    s = Song.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(s)
    s.artist = artist
    s
    # binding.pry
  end
end
