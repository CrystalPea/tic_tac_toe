class TicTacToeGrid
  attr_reader :grid
  def initialize
    @a = [nil, nil, nil]
    @b = [nil, nil, nil]
    @c = [nil, nil, nil]
    @grid = [a, b, c]
  end

  private
  attr_accessor :a, :b, :c
end
