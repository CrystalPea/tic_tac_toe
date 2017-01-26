require 'game'

describe Game do
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }
  subject(:game) { described_class.new(player_1, player_2) }

  it "has player_1" do
    expect(game.player_1).to eq player_1
  end

  it "players take turns until game is over" do
    allow(player_1).to receive(:play)
    game.play
    expect(game.active_player).to eq player_2
  end

end
