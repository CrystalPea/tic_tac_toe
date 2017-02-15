require 'game'

describe Game do
  let(:player_1) { double :player_1, name: "player_1"}
  let(:player_2) { double :player_2 }
  let(:board) { double :board }
  subject(:game) { described_class.new(player_1, player_2, board) }

  it "has player_1" do
    expect(game.player_1).to eq player_1
  end

  describe "#play" do
    context "#game flow" do
      let(:params) { ({row: :a, column: 0, value: :x}) }
      before do
        allow(board).to receive(:field_taken?).with(params) { false }
        allow(board).to receive(:field_exists?).with(params) { true }
      end

      it "players take turns until game is over" do
        allow(board).to receive(:change_field).with(params)
        allow(board).to receive(:win?) { false }
        allow(board).to receive(:full?) { false }
        game.play(params)
        expect(game.active_player).to eq player_2
      end

      it "lets active player take a field" do
        expect(board).to receive(:change_field).with(params)
        allow(board).to receive(:win?) { false }
        allow(board).to receive(:full?) { false }
        game.play(params)
      end
    end
    context "#prohibited moves" do
      it "doesn't allow player to take an already taken field" do
        params = {row: :a, column: 0, value: :x}
        allow(board).to receive(:field_taken?).with(params) { true }
        expect(board).not_to receive(:change_field)
        allow(board).to receive(:win?) { false }
        allow(board).to receive(:full?) { false }
        game.play(params)
      end

      it "does not allow values outside the board scope" do
        params = {row: :a, column: 3, value: :x}
        allow(board).to receive(:field_taken?).with(params) { false }
        allow(board).to receive(:field_exists?).with(params) { false }
        expect(game.play(params)).to eq "No cheating!"
      end
    end
  end

  describe "#game_over?" do
    let(:params) { ({row: :a, column: 0, value: :x}) }
    before do
      allow(board).to receive(:field_taken?).with(params) { false }
      allow(board).to receive(:field_exists?).with(params) { true }
      allow(board).to receive(:change_field).with(params)
    end

    it "ends when active player wins" do
      allow(board).to receive(:win?) { true }
      expect { game.play(params) }.to raise_error("Game over! player_1 wins!")
    end

    it "ends when board full" do
      allow(board).to receive(:win?) { false }
      allow(board).to receive(:full?) { true }
      expect { game.play(params) }.to raise_error("Game over, it's a draw!")
    end
  end
end
