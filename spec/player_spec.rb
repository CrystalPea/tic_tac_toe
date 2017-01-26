require 'player'

describe Player do
  let(:player_1) { double :player_1 }
  subject(:player) { described_class.new(player_1) }

  it "has a name" do
    expect(player.name).to eq player_1
  end
end
