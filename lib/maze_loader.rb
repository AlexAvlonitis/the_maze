require_relative 'maze_constants'

class MazeLoader

  def initialize(path = MazeConstants::MAZE_FILES_DEFAULT_DIR, maze_file)
    @maze_file = maze_file
    @path = path
    check_maze_validity
  end

  def maze_array
    return_maze_file_array
  end

  private
  # Encapsulated the instance variables to be accessed by their methods
  attr_reader :maze_file, :path

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

  def return_maze_file_array
    # Split each letter from the file if it includes _, X, G, or S
    # And create a 2 dimensional array
    File.foreach(path + maze_file).map { |line| line.scan(/\_|X|G|S/) }
  end
end
