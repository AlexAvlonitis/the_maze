require_relative 'recursive_algorithm'

class MazeSolver

  def self.build(maze_array, algorithm = 'recursive')
    new(RecursiveAlgorithm.new(maze_array)) if algorithm == 'recursive'
  end

  def initialize(algorithm)
    @algorithm = algorithm
  end

  def solve
    if algorithm.solve_maze
      puts "solved"
      p algorithm.position.container
    else
      # if the maze doesn't have a goal
      puts "unsolvable"
    end
  end

  private
  attr_reader :algorithm
end
