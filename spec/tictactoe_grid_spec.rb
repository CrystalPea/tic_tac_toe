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

end
