require 'maze_constants'
require 'pry'

class MazeLoader

  def initialize(path = MazeConstants::MAZE_FILES_DEFAULT_DIR, maze_file)
    @maze_file = maze_file
    @path = path
    check_maze_validity
  end

  def maze
    read_and_return_file
  end

  private
  attr_reader :maze_file, :path #encapsulated the instance variables to be accessed by their methods

  def check_maze_validity
    check_file_presence
    check_file_extension
  end

  def check_file_presence
    error = "File cannot be found, please place a file into the maze_files dir or specify your own path"
    raise error unless File.file?(path + maze_file)
  end

  def check_file_extension
    error = "Invalid maze extension file, requires '.maze' files"
    raise error unless MazeConstants::MAZE_EXTENSION_REGEX.match(maze_file)
  end

  def read_and_return_file
    file = File.open(path + maze_file, "r")
    data = file.read
    file.close
    data
  end
end
