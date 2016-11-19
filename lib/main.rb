require_relative 'maze_loader'
require_relative 'maze'
require_relative 'maze_solver'

maze = Maze.build

maze.solve
