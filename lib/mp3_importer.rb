require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    mp3s = Dir.entries(@path).select{|song| song[-4,4] == '.mp3'}
  end

  def import

    self.files.each do |x|
      Song.new_by_filename(x)
    end
  end

end
