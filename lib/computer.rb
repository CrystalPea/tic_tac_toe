require_relative 'player'
class Computer < Player
  GOOD_FIRST_MOVES = [{row: :a, column: 0}, {row: :a, column: 2}, {row: :b, column: 1}, {row: :c, column: 0}, {row: :c, column: 2}]
  ROWS = [:a, :b, :c]
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
    if row = danger_in_row?(board)
      return {row: ROWS[board.grid.index(row)], column: row.index(nil)}
    end
    sideways = flip_board(board)
    if row = danger_in_column?(sideways)
      return {row: ROWS[row.index(nil)], column: sideways.index(row) }
    end
  end
  
  def danger_in_row?(board)
    board.grid.each { |row| return row  if row.count(opponent) == 2 }
    false
  end

  def danger_in_column?(sideways)
    sideways.each {|row| return row if row.count(opponent) == 2 }
    false
  end
    
  def flip_board(board)
    sideways = [[], [], []]
    board.grid.each {|row| sideways[0] << row[0]; sideways[1] << row[1]; sideways[2] << row[2] }
    sideways
  end
end
