require_relative 'maze_loader'
require_relative 'maze'
require_relative 'maze_solver'

# You can include a maze Maze.build('mymaze.maze'), by placing it into the maze_files directory
# Or leave blank for the default one generated in the class
maze = Maze.build

# As a second paramater you can include a different solving algorithm
maze_solver = MazeSolver.build(maze.map, 'recursive')

# Run and solve the maze, print the results
maze_solver.solve
