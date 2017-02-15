require 'board'

describe Board do
  subject(:board) { described_class.new }

  it "has 9 empty fields" do
    grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(board.grid).to eq grid
  end

  describe "#change_field" do
    it "allows field property to be changed" do
      board.change_field({row: :a, column: 0, value: :x})
      grid = [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
      expect(board.grid).to eq grid
    end

    it "checks if the field is taken" do
      board.change_field({row: :a, column: 0, value: :x})
      expect(board.field_taken?({row: :a, column: 0, value: :x})).to eq true
    end
  end

  describe "#win?" do
    it "checks that game not won yet" do
      expect(board.win?).to eq false
    end

    it "checks that game is won" do
      n = 0
      3.times { board.change_field({row: :a, column: n, value: :x}); n += 1 }
      expect(board.win?).to eq true
    end

    it "checks for vertical wins" do
      [:a,:b,:c].each do |row|
        board.change_field({row: row, column: 1, value: :x})
      end
      expect(board.win?).to eq true
    end

    it "checks for diagonal wins" do
      n = 0
      [:a,:b,:c].each do |row|
        board.change_field({row: row, column: n, value: :x})
        n += 1
      end
      expect(board.win?).to eq true
    end
  end

  describe "#full?" do
    it "returns false if board is not full" do
      expect(board.full?).to eq false
    end

    it "returns true if board is full" do
      [:a,:b,:c].each do |row|
        n = 0
        3.times do
           board.change_field({row: row, column: n, value: :x})
           n += 1
        end
      end
      expect(board.full?).to eq true
    end
  end

  describe "#empty?" do
    it "returns true if board empty" do
      expect(board.empty?).to eq true
    end
    it "returns false if board not empty" do
     board.change_field({row: :a, column: 0, value: :x}) 
     expect(board.empty?).to eq false
    end
    it "returns false if :o made a move" do
     board.change_field({row: :a, column: 0, value: :o})
     expect(board.empty?).to eq false
    end
  end
  it "checks for non-existent fields" do
    expect(board.field_exists?({row: :c, column: 3})).to eq false
  end
end
