require_relative '../lib/maze_array_checker'

describe MazeArrayChecker do
  working_maze_array  = [["_", "X", "G"],
                         ["S", "_", "_"]]

  three_dimensional_maze_array = [[["_", "_", "G"],["_", "_", "X"]],
                                  ["S", "_", "_", "X", "X", "X"]]

  let(:subject) { described_class.new(working_maze_array) }

  # Public interface
  it { is_expected.to respond_to :check }

  context 'When tha maze array is correct' do
    describe '#check' do
      it "should return true" do
        expect(subject.check).to eq true
      end
    end
  end

  context 'When tha maze array is incorrect' do
    describe '#check' do
      it "should raise an error if it's not 2 dimensional" do
        subject = MazeArrayChecker.new(three_dimensional_maze_array)
        error = "The array is not 2 dimensional, please enter a 2 dimensional array"
        expect{ subject.check }.to raise_error error
      end

      it "should raise an error if the starting and ending points coinside" do
        error = 'Starting point should not coinside with the ending point'
        allow(subject).to receive(:starting_point) { [0][1] }
        allow(subject).to receive(:ending_point) { [0][1] }
        expect{ subject.check }.to raise_error error
      end
    end
  end

end
