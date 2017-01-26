require 'tictactoe_grid'

describe TicTacToeGrid do
  subject(:tictactoe) { described_class.new }

  it "has 9 empty fields" do
    grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(tictactoe.grid).to eq grid
  end

  it "allows field property to be changed" do
    tictactoe.change_field(:a, 0, :x)
    grid = [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(tictactoe.grid).to eq grid
  end

end
