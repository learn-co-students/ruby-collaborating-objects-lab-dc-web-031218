class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(filename)
    parts  = filename.split(" - ")
    # binding.pry
    song = self.new(parts[1])
    song.artist_name = parts[0]
    # binding.pry
    # song.artist.name = parts[0]
    # binding.pry
    #song.name = filename.split(" - ")[1]
    song
  end

  def artist_name=(name)

      self.artist = Artist.find_or_create_by_name(name).add_song(self)

  end


end
