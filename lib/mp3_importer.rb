require 'pry'


class MP3Importer

  @path = ""

  def initialize(path)
    @path = path
  end


  def files
    list = Dir.entries(self.path)
    newList = []
    list.each do |l|
      if l != "." && l != ".."
        newList << l
      end
    end
    newList
  end

  def path
    @path
  end

  # def import
  #   list = Dir.entries(self.path)
  #   binding.pry
  # end
  def import
    files.each{ |filename| (Song.new_by_filename(filename)) }
  end


end
