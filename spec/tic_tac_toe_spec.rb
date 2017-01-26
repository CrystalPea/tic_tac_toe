require 'tic_tac_toe'

describe TicTacToe do
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }
  subject(:tictactoe) { described_class.new(player_1, player_2) }

  it "has player_1" do
    expect(tictactoe.player_1).to eq player_1
  end

end
