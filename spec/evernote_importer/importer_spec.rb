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
    
    # Using a mock or stub to stand-in for the filesystem
    it "returns a list of files" do
      # Dir.glob(File.join(@directory, "*.*"))
      # Dir.stub(:glob).and_return(['file1', 'file2'])  # => stub
      Dir.should_receive(:glob).and_return(['file1', 'file2'])  # => mock expectation
      @importer.files.should == ['file1', 'file2']
    end
    
    it "should create a new note in evernote for each file" do
      pending("Not Yet Implemented")
      # how to make sure external app is called either via rubyosa or %x[shell cmd]
      
      # test that you have the same number of new notes as elements in the files array
      
      # test that each note created has the same text as the file
    end
    
    it "can create a new note" do
      # # from_file should be the only required option.  also want to test for with title = filename and notebook
      # # form cmd line args
      # evernote = double('evernote')
      # evernote.should_receive(:create_note).and_return(mock("Note"))
      # # evernote.should_receive(:create_note).with(:from_file).and_return(mock("Note"))
      # @importer.evernote = evernote
      # @importer.create # make !
      
      app = OSA.app('Evernote')
      app.should_receive(:create_note).and_return(mock("Note"))
      @importer.create
    end
    
    it "errors when notebook doesn't exist"
    
  end
end