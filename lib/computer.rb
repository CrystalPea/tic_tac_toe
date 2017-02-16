require_relative 'player'
class Computer < Player
  GOOD_FIRST_MOVES = [{row: :a, column: 0}, {row: :a, column: 2}, {row: :b, column: 1}, {row: :c, column: 0}, {row: :c, column: 2}]
  @my_value = nil
  @opponent = nil
  attr_reader :my_value, :opponent
 
  def board_empty?(board)
    board.empty?
  end


  def make_move(board)
    if board_empty?(board)
      self.my_value, self.opponent = :x, :o
      play(GOOD_FIRST_MOVES.sample)
    else
     self.my_value, self.opponent = :o, :x if board.unique_elements_number == 2
     choose_best_move(board) 
    end
  end

  private
  attr_writer :my_value, :opponent
  
  def choose_best_move(board)
    rows = [:a, :b, :c]
    board.grid.each { |row| return {row: rows[board.grid.index(row)], column: row.index(nil)} if row.count(opponent) == 2 }
  end
end
