require_relative '../lib/maze_solver'
require_relative '../lib/recursive_algorithm'

describe MazeSolver do
  maze_array = [["_", "X", "G"],
                ["S", "_", "_"]]

  unsolvable_maze = [["_", "_", "_", "_", "G", "X", "_", "X"],
                    ["_", "X", "X", "X", "X", "X", "_", "_"],
                    ["X", "S", "_", "_", "_", "_", "_", "X"]]

  recursive_algorithm = RecursiveAlgorithm.new(maze_array)
  let(:subject) { described_class.new(recursive_algorithm) }

  context 'When the maze is solved' do
    describe '#solve' do
      it "should return true" do
        expect(subject.solve).to be_truthy
      end
    end
  end

  context 'When the maze is not solved' do
    describe '#solve' do
      it "should return false" do
        recursive_algorithm = RecursiveAlgorithm.new(unsolvable_maze)
        subject = MazeSolver.new(recursive_algorithm)
        expect(subject.solve).to be_falsey
      end
    end
  end
end
