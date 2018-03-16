class MP3Importer
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
  end

  def files
    mp3s = Dir.entries(@path).select { |x| x.include?(".mp3")}
  end

  def import
    self.files.each { |x| Song.new_by_filename(x) }

  end



end
