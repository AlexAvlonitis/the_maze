require_relative 'maze_array_checker'
require_relative 'maze_constants'
require_relative 'maze_loader'
require_relative 'maze_solver'

class Maze

  # Dependency injection *DI
  def self.build(maze_file = 'harder.maze')
    new(MazeLoader.new(maze_file))
  end

  def initialize(maze_loader)
    @maze_loader = maze_loader
    # Check the integrity of the maze before continuing
    maze_array_checker.check
  end

  def map
    # return the maze array if checks passed
    map_to_array
  end

  def maze_array_checker
    @maze_array_checker = MazeArrayChecker.new(map_to_array)
  end

  private
  # Encapsulated the instance variables to be accessed by their methods
  attr_reader :maze_loader

  def map_to_array
    # Split each letter from the file if it's either: _ , X, G, or S
    # And create a 2 dimensional array
    File.foreach(MazeConstants::MAZE_FILES_DEFAULT_DIR + maze_loader.maze_file)
        .map { |line| line.scan(/\_|X|G|S/) }
  end
end
