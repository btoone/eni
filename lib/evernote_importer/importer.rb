module EvernoteImporter
  class Importer
    require 'rbosa'
    
    attr_reader :directory
    # attr_writer :evernote
    
    def initialize(directory)
      self.exists?(directory)
      @evernote = OSA.app('Evernote')
    end
    
    def directory=(directory)
      self.exists?(directory)
    end
    
    def files
      # ['one', 'two', 'three']
      # Dir.entries(@directory)
      Dir.glob(File.join(@directory, "*.*"))
    end
    
    def create
      self.files.each do |f|
        @evernote.create_note(:from_file => f)
      end
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