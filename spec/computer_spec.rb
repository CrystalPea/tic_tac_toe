require 'computer'
describe Computer do
  let(:bmo) { double :bmo }
  subject(:computer) { described_class.new(bmo) }
  
  it "has a name" do
    expect(computer.name).to eq bmo
  end
  describe "#play" do
    it "can play" do
      hash = {row: "A", column: "0"}
      expect(computer.play(hash)).to eq({row: :a, column: 0})
    end
  end
end

