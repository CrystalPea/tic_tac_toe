require 'game'

describe Game do
  let(:player_1) { double :player_1, name: "player_1"}
  let(:player_2) { double :player_2 }
  let(:grid) { double :grid }
  subject(:game) { described_class.new(player_1, player_2, grid) }

  it "has player_1" do
    expect(game.player_1).to eq player_1
  end

  it "players take turns until game is over" do
    params = {row: :a, column: 0, value: :x}
    allow(grid).to receive(:field_taken?).with(params) { false }
    allow(grid).to receive(:change_field).with(params)
    allow(grid).to receive(:win?) { false }
    game.play(params)
    expect(game.active_player).to eq player_2
  end

  it "lets active player take a field" do
    params = {row: :a, column: 0, value: :x}
    allow(grid).to receive(:field_taken?).with(params) { false }
    expect(grid).to receive(:change_field).with(params)
    allow(grid).to receive(:win?) { false }
    game.play(params)
  end

  it "doesn't allow player to take an already taken field" do
    params = {row: :a, column: 0, value: :x}
    allow(grid).to receive(:field_taken?).with(params) { true }
    expect(grid).not_to receive(:change_field)
    allow(grid).to receive(:win?) { false }
    game.play(params)
  end

  it "ends when active player wins" do
    params = {row: :a, column: 0, value: :x}
    allow(grid).to receive(:field_taken?).with(params) { false }
    allow(grid).to receive(:change_field).with(params)
    allow(grid).to receive(:win?) { true }
    expect { game.play(params) }.to raise_exception("Game over! player_1 wins!")
  end

end
