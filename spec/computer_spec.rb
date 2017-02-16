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
  describe "#empty?" do
    it "checks if board is empty" do
      allow(board).to receive(:empty?) { true }
      expect(computer.board_empty?(board)).to eq true
    end
   it "knows if the board not empty" do
     allow(board).to receive(:empty?) { false }
     expect(computer.board_empty?(board)).to eq false
    end
  end
  describe "#make_move" do
    context "board empty" do
      it "makes a move in one of the corners or centre if board empty" do
        allow(board).to receive(:empty?) { true }
        good_first_moves = [ {row: :a, column: 0}, {row: :a, column: 2}, {row: :b, column: 1}, {row: :c, column: 0}, {row: :c, column: 2} ]
        expect(good_first_moves).to include(computer.make_move(board)) 
      end
      it "knows that it plays :x when it gets first move" do
        allow(board).to receive(:empty?) { true }
        computer.make_move(board)
        expect(computer.my_value).to eq :x
      end
    end
    
    context "board not empty" do
      it "prevents oppopent from getting a winning row" do
        allow(board).to receive(:empty?) { false }
        allow(board).to receive(:unique_elements_number) { 2 }
        allow(board).to receive(:grid) { [[:x, nil, nil], [:x, :x, nil], [nil, nil, nil]] }
        expect(computer.make_move(board)).to eq({row: :b, column: 2})
      end

      it "knows that it plays :o if opponent moved first" do
        allow(board).to receive(:empty?) { false }
        allow(board).to receive(:unique_elements_number) { 2 }
        allow(board).to receive(:grid) { [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]] }
        computer.make_move(board)
        expect(computer.my_value).to eq :o
      end
      
      it "prevents opponent from getting a winning column" do
        allow(board).to receive(:empty?) { false }
        allow(board).to receive(:unique_elements_number) { 2 }
        allow(board).to receive(:grid) { [[:x, nil, nil], [:x, nil, nil], [nil, nil, nil]] }
        expect(computer.make_move(board)).to eq({row: :c, column: 0})
      end
      it "prevents opponent from getting a diagonal win - axis_1" do
        allow(board).to receive(:empty?) { false }
        allow(board).to receive(:unique_elements_number) { 2 }
        allow(board).to receive(:grid) { [[:x, nil, nil], [nil, :x, nil], [nil, nil, nil]] }
        expect(computer.make_move(board)).to eq({row: :c, column: 2})
      end

      it "prevents opponent from getting a diagonal win - axis_2" do
        allow(board).to receive(:empty?) { false }
        allow(board).to receive(:unique_elements_number) { 2 }
        allow(board).to receive(:grid) { [[nil, nil, :x], [nil, :x, nil], [nil, nil, nil]] }
        expect(computer.make_move(board)).to eq({row: :c, column: 0})
      end
      
    end
  end
end

