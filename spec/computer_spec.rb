require 'computer'
describe Computer do
  let(:bmo) { double :bmo }
  subject(:computer) { described_class.new(bmo) }
  let(:board) { double :board }  

  it "has a name" do
    expect(computer.name).to eq bmo
  end
  describe "#play" do
    it "can play" do
      hash = {row: "A", column: "0"}
      expect(computer.play(hash)).to eq({row: :a, column: 0})
    end
  end
  it "checks if board is empty" do
    allow(board).to receive(:empty?) { true }
    expect(computer.board_empty?(board)).to eq true
  end
  it "knows if the board not empty" do
    allow(board).to receive(:empty?) { false }
    expect(computer.board_empty?(board)).to eq false
  end
end

