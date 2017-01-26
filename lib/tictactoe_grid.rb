class TicTacToeGrid
  attr_reader :grid
  def initialize
    @a = [nil, nil, nil]
    @b = [nil, nil, nil]
    @c = [nil, nil, nil]
    @grid = [a, b, c]
  end

  def change_field(params)
    (self.send(params[:row]))[params[:column]] = params[:value]
  end

  def field_taken?(params)
    (self.send(params[:row]))[params[:column]] != nil
  end

  private
  attr_accessor :a, :b, :c
end
