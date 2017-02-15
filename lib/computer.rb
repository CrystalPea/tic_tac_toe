require_relative 'player'
class Computer < Player

  def board_empty?(board)
    board.empty?
  end

end
