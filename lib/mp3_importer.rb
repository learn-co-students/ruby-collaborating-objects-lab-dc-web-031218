class MP3Importer
  attr_accessor :path, :artist, :song

  @@all = []

  def initialize(path)
    @path = path
  end

  def convert_files_to_strings
    @files_strings = Dir.glob("#{path}/*.mp3")
    @files = []
    @files_strings.select do |filename|
      filename = filename.split("#{path}/")
      @files << filename[1]
    end
    @files
  end

  def files
    convert_files_to_strings
    @array = []
      @files.each do |file|
        @array << file
      end
    return @array
  end

  def self.all
    @@all
  end

  def all
    @@all
  end

  def self.name
    @song_name
  end

  def artist=(artist)
    artist
  end

  def import
    files
     @array.each do |filename|
       name = filename.split(" - ")
       @song_artist = name[0]
       @song_name = name[1]
       song = Song.new(@song_name)
       artist = Artist.find_or_create_by_name(@song_artist)
       artist.add_song(song)
       song.artist = artist
     end
   end

end
