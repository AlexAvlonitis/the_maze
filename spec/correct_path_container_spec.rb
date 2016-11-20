require_relative '../lib/correct_path_container'

describe CorrectPathContainer do
  let(:x) {double :x}
  let(:y) {double :y}
  let(:a) {double :a}
  let(:b) {double :b}

  let(:subject) { described_class.new }

  # Public interface
  it { is_expected.to respond_to :show }
  it { is_expected.to respond_to :add }
  it { is_expected.to respond_to :remove }

  describe "#add" do
    it "adds values into the container" do
      subject.add(x,y)
      subject.add(a,b)
      expect(subject.show).to eq [[a,b], [x,y]]
    end
  end

  describe "#remove" do
    it "removes the first value from the container" do
      subject.add(x,y)
      subject.add(a,b)
      subject.remove
      expect(subject.show).to eq [[x,y]]
    end
  end

end
