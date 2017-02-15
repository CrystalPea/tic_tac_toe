require 'player'

describe Player do
  let(:player_1) { double :player_1 }
  subject(:player) { described_class.new(player_1) }

  it "has a name" do
    expect(player.name).to eq player_1
  end

  describe "#play" do
    it "can play" do
      hash = {row: "A", column: "0"}
      expect(player.play(hash)).to eq({row: :a, column: 0})
    end
  end


end
