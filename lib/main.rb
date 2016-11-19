require_relative 'maze_loader'
require_relative 'maze'
require_relative 'maze_solver'

# you can include a maze Maze.build('mymaze.maze'), by placing it into the maze_files directory
# or leave blank for the default one generated in the class
maze = Maze.build

# second paramater you can include a different solving algorithm
maze_solver = MazeSolver.build(maze.maze_array, 'recursive')

# run and solve the maze, print the results
maze_solver.solve
