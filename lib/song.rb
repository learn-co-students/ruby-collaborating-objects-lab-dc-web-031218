require_relative './artist.rb'
require_relative './mp3_importer.rb'


class Song

attr_accessor :name, :artist

def initialize(name)
  @name = name
end


def self.new_by_filename(file)
song_title = file.split(" - ")[1]
song_artist = file.split(" - ")[0]
new_song = self.new(song_title)
new_song.artist = Artist.find_or_create_by_name(song_artist)
new_song.artist.add_song(new_song)
new_song
end



end
