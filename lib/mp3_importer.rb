require "pry"
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # binding.pry
    Dir.glob("#{path}/*").collect do |song|
      song.split("/")[-1]
    end
  end

  def import
    files.map do |file_name|
      Song.new_by_filename(file_name)
    end
    
  end
end
