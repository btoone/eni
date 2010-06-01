module EvernoteImporter
  class Importer
    # require 'find'
    
    attr_reader :directory
    # attr_writer :directory
    
    def initialize(directory)
      self.exists?(directory)
      # puts "Enter the location of the files:"
    end
    
    def directory=(directory)
      self.exists?(directory)
    end
    
    def files
      # ['one', 'two', 'three']
      # Dir.entries(@directory)
      Dir.glob(File.join(@directory, "*.*"))
    end
    
    protected
    
    def exists?(directory)
      if File.directory?(directory)
        @directory = directory
      else
        @directory = nil
      end      
    end
    
  end
end