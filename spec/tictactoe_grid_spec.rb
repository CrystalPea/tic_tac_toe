require 'tictactoe_grid'

describe TicTacToeGrid do
  subject(:tictactoe) { described_class.new }

  it "has 9 empty fields" do
    grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(tictactoe.grid).to eq grid
  end

  it "allows field property to be changed" do
    tictactoe.change_field({row: :a, column: 0, value: :x})
    grid = [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(tictactoe.grid).to eq grid
  end

  it "checks if the field is taken" do
    tictactoe.change_field({row: :a, column: 0, value: :x})
    expect(tictactoe.field_taken?({row: :a, column: 0, value: :x})).to eq true
  end

  describe "#win?" do
    it "checks that game not won yet" do
      expect(tictactoe.win?).to eq false
    end

    it "checks that game is won" do
      n = 0
      3.times { tictactoe.change_field({row: :a, column: n, value: :x}); n += 1 }
      expect(tictactoe.win?).to eq true
    end

    it "checks for vertical wins" do
      tictactoe.change_field({row: :b, column: 1, value: :x})
      tictactoe.change_field({row: :a, column: 1, value: :x})
      tictactoe.change_field({row: :c, column: 1, value: :x})
      expect(tictactoe.win?).to eq true
    end

    it "checks for diagonal wins" do
      tictactoe.change_field({row: :a, column: 0, value: :x})
      tictactoe.change_field({row: :b, column: 1, value: :x})
      tictactoe.change_field({row: :c, column: 2, value: :x})
      expect(tictactoe.win?).to eq true
    end
  end

  describe "#full?" do
    it "returns false if board is not full" do
      expect(tictactoe.full?).to eq false
    end

    it "returns true if board is full" do
      n = 0
      3.times { tictactoe.change_field({row: :a, column: n, value: :x}); n += 1 }
      n = 0
      3.times { tictactoe.change_field({row: :b, column: n, value: :x}); n += 1 }
      n = 0
      3.times { tictactoe.change_field({row: :c, column: n, value: :x}); n += 1 }
      expect(tictactoe.full?).to eq true
    end
  end
end
