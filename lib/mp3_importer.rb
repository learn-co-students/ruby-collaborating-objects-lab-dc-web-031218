require "pry"

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    # accepts a file path to parse mp3 files from
    @files = []
    @path = path
    files
  end

  def files
    Dir["#{path}/*.mp3"].collect do |filepath|
      split_path = filepath.split("/")
      split_path[-1]
    end
  end

  def self.all
    @@all ||= []
  end

  def import
      # imports the files into the library by creating songs from a filename
    self.files.each do |file|
      song = Song.new_by_filename(file)

      # need to get artist name
      split = file.split(" - ")
      artist = split[0]

      found_artist = Artist.find_or_create_by_name(artist)
      song.artist = found_artist

      found_artist.add_song(song)
      # binding.pry
    end

  end

end
