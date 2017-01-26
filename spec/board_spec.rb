require 'board'

describe Board do
  subject(:board) { described_class.new }

  it "has 9 empty fields" do
    grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(board.grid).to eq grid
  end

  it "allows field property to be changed" do
    board.change_field({row: :a, column: 0, value: :x})
    grid = [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(board.grid).to eq grid
  end

  it "checks if the field is taken" do
    board.change_field({row: :a, column: 0, value: :x})
    expect(board.field_taken?({row: :a, column: 0, value: :x})).to eq true
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
      board.change_field({row: :b, column: 1, value: :x})
      board.change_field({row: :a, column: 1, value: :x})
      board.change_field({row: :c, column: 1, value: :x})
      expect(board.win?).to eq true
    end

    it "checks for diagonal wins" do
      board.change_field({row: :a, column: 0, value: :x})
      board.change_field({row: :b, column: 1, value: :x})
      board.change_field({row: :c, column: 2, value: :x})
      expect(board.win?).to eq true
    end
  end

  describe "#full?" do
    it "returns false if board is not full" do
      expect(board.full?).to eq false
    end

    it "returns true if board is full" do
      n = 0
      3.times { board.change_field({row: :a, column: n, value: :x}); n += 1 }
      n = 0
      3.times { board.change_field({row: :b, column: n, value: :x}); n += 1 }
      n = 0
      3.times { board.change_field({row: :c, column: n, value: :x}); n += 1 }
      expect(board.full?).to eq true
    end
  end

  it "checks for non-existent fields" do
    expect(board.no_such_field?({row: :c, column: 3})).to eq true
  end
end
