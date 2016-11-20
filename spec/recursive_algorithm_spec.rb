require_relative '../lib/recursive_algorithm'

describe RecursiveAlgorithm do
  maze_array = [["_", "X", "G"],
                ["S", "_", "_"]]

  unsolvable_maze = [["_", "_", "_", "_", "G", "X", "_", "X"],
                    ["_", "X", "X", "X", "X", "X", "_", "_"],
                    ["X", "S", "_", "_", "_", "_", "_", "X"]]

  let(:subject) { described_class.new(maze_array) }

  # Public interface
  it { is_expected.to respond_to :solve_maze }
  it { is_expected.to respond_to :correct_path_container }

  context 'When the maze is solved' do
    describe '#solve_maze' do
      it "should return true and the correct path should be saved in CorrectPathContainer" do
        expect(subject.solve_maze).to be_truthy
        expect(subject.correct_path_container.show).to eq [[1, 0], [1, 1], [1, 2]]
      end
    end
  end

  context 'When the maze is not solved' do
    describe '#solve_maze' do
      it "should return false" do
        subject = RecursiveAlgorithm.new(unsolvable_maze)
        expect(subject.solve_maze).to be_falsey
      end
    end
  end



end
