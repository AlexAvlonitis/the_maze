require_relative 'maze_loader'
require_relative 'maze_solver'

class Maze

  # Dependency injection *DI
  def self.build(maze_file = 'harder.maze')
    new(MazeLoader.new(maze_file))
  end

  def initialize(loaded_maze)
    @loaded_maze = loaded_maze
  end

  def solve
    maze_algorithm.execute
  end

  # single point of contact for the MazeAlgorithm class
  # keep the same instance until the class has been changed
  def maze_algorithm
    @maze_algorithm ||= MazeSolver.new(maze_array)
  end

  private
  # encapsulated the instance variables to be accessed by their methods
  attr_reader :loaded_maze

  def maze_array
    loaded_maze.maze_array
  end

end
