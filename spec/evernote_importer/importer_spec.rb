require 'spec_helper'

module EvernoteImporter
  
  describe Importer do
    before(:each) do
      @importer = Importer.new("/Users/Brandon/Desktop")
    end
    
    # creates attr_reader and @directory
    it "should initially have a directory of the specified directory" do
      @importer.directory.should == "/Users/Brandon/Desktop"
      @importer.directory = "/Users/Brandon/code"
      @importer.directory.should == "/Users/Brandon/code"
    end
    
    # forces check of initialized directory
    it "should not set @directory if directory doesn't exist" do
      @invalid_importer = Importer.new("/Invalid/Directory")
      @invalid_importer.directory.should == nil
    end
    
    it "should not set @directory if the specified directory doesn't exist" do
      @importer.directory = "/invalid/directory"
      @importer.directory.should == nil
    end
    
    it "should return a list of files" do
      files = @importer.files
      files.should be_a_kind_of(Array)
      
      # test that each elem is a file - fails on a directory
      files.each do |f|
        File.file?(f).should == true 
      end
      
    end
    
    it "should get a list of files from the initialized directory" do
      initialized_dir = @importer.directory
      importer_list_of_files = @importer.files
      
      # get list of files from the same dir as importer object and compare to what
      # the method returns
      actual_list_of_files = Dir.glob( File.join( initialized_dir, "*.*" ) )
      importer_list_of_files.should == actual_list_of_files
    end
    
    it "should create a new note in evernote for each file"
      # how to make sure external app is called either via rubyosa or %x[shell cmd]
      
      # test that you have the same number of new notes as elements in the files array
      
      # test that each note created has the same text as the file
  end
end