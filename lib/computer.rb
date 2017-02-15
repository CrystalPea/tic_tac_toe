require_relative 'player'
class Computer < Player
  GOOD_FIRST_MOVES = [{row: :a, column: 0}, {row: :a, column: 2}, {row: :b, column: 1}, {row: :c, column: 0}, {row: :c, column: 2}]
  
  def board_empty?(board)
    board.empty?
  end

  def make_move
    play(GOOD_FIRST_MOVES.sample)
  end

end
