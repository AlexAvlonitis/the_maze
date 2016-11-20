require_relative '../lib/maze_loader'
require_relative '../lib/maze'

describe Maze do
  let(:maze_file) { 'maze1.maze' }
  let(:maze_loader) { MazeLoader.new(maze_file) }
  let(:subject) { described_class.new(maze_loader) }
  maze_array = [["_", "_", "_", "_", "G", "_", "_", "X"],
                ["_", "_", "_", "X", "X", "X", "_", "_"],
                ["X", "_", "_", "_", "_", "_", "_", "X"],
                ["_", "_", "X", "X", "X", "X", "_", "_"],
                ["_", "_", "_", "X", "_", "_", "_", "_"],
                ["_", "_", "S", "_", "_", "X", "_", "_"]]

  it { is_expected.to respond_to :map }

  context 'When starting and loading the Maze' do
    describe '#map' do
      it "should return the converted maze map array" do
        expect(subject.map).to eq maze_array
      end
    end

  end

end
