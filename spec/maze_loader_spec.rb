require_relative '../lib/maze_loader'

describe MazeLoader do
  let(:maze_file) { 'maze1.maze' }
  let(:wrong_maze_file) { 'dummy_test.txt' }
  let(:subject) { described_class.new(maze_file) }
  let(:wrong_file_subject) { described_class.new(wrong_maze_file) }
  let(:wrong_path_subject) { described_class.new('/not_real_directory/', maze_file) }
  let(:content) { ["_","_","_","_","G","_","_","X"] }

  context 'When the maze file is correct' do
    describe '#maze_array' do
      it 'returns true if the file is correct' do
        expect(subject.maze_array).to be_truthy
      end

      it 'returns true if it includes part the file content' do
        expect(subject.maze_array).to include content
      end
    end
  end

  context 'When the maze file is incorrect' do
    describe '#maze_array' do
      it 'raises an error if the file does not exist' do\
        error = "File cannot be found, please place a file into the maze_files dir or specify your own path"
        expect { wrong_path_subject }.to raise_error error
      end

      it 'raises an error if the file has wrong extension' do\
        error = "Invalid maze extension file, requires '.maze' files"
        expect { wrong_file_subject }.to raise_error error
      end
    end
  end


end
