require_relative '../../lib/maze'
require_relative '../../lib/maze_loader'
require_relative '../../lib/maze_solver'

describe 'Feature test 1: Generate a Maze and solve it' do

  context 'When a Maze creation is correct and the maze solvable' do
    it "should return true" do
      maze = Maze.build
      maze_solver = MazeSolver.build(maze.map, 'recursive')
      expect(maze_solver.solve).to be_truthy
    end
  end

  context 'When a Maze creation is correct and the maze Unsolvable' do
    it "should return true" do
      maze = Maze.build('unsolvable.maze')
      maze_solver = MazeSolver.build(maze.map, 'recursive')
      expect(maze_solver.solve).to be_falsey
    end
  end

  context 'When a Maze creation is not correct because the maze file does not exist' do
    it "should return file not found error" do
      error = "File cannot be found, please place a file into the maze_files dir or specify your own path"
      expect{ Maze.build('non_existent_maze') }.to raise_error error
    end
  end

  context 'When a Maze creation is not correct because the maze file extension is not .maze' do
    it "should return file extension error" do
      error = "Invalid maze extension file, requires '.maze' files"
      expect{ Maze.build('dummy_test.txt') }.to raise_error error
    end
  end
end
