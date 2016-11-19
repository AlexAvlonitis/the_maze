require_relative 'maze_constants'

class MazeLoader
  attr_reader :maze_file

  def initialize(maze_file)
    @maze_file = maze_file
    check_maze_validity
  end

  private
  # Encapsulated the instance variables to be accessed by their methods
  attr_reader :path

  def check_maze_validity
    check_file_presence
    check_file_extension
  end

  def check_file_presence
    error = "File cannot be found, please place a file into the maze_files dir or specify your own path"
    raise error unless File.file?(MazeConstants::MAZE_FILES_DEFAULT_DIR + maze_file)
  end

  def check_file_extension
    error = "Invalid maze extension file, requires '.maze' files"
    raise error unless MazeConstants::MAZE_EXTENSION_REGEX.match(maze_file)
  end
end
