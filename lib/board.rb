class Board
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

  def win?
    return true if horizontal_win?
    return true if vertical_win?
    return true if diagonal_win?
    false
  end

  def full?
    grid.each {|row| return false if row.include?(nil) }
    true
  end

  def empty?
    grid.each {|row| return false if row_not_empty?(row) }
    true
  end

  def field_exists?(params)
    (0..2).member?(params[:column])
  end

  private
  attr_accessor :a, :b, :c
  def row_not_empty?(row)
    row.include?(:x) || row.include?(:o)
  end

  def horizontal_win?
    grid.each {|row| return true if winning_row?(row) }
    false
  end

  def vertical_win?
    sideways = [[], [], []]
    grid.each {|row| sideways[0] << row[0]; sideways[1] << row[1]; sideways[2] << row[2] }
    sideways.each {|row| return true if winning_row?(row) }
    false
  end

  def diagonal_win?
    axis_1 = [a[0], b[1], c[2]]
    return true if winning_row?(axis_1)
    axis_2 = [c[0], b[1], a[2]]
    return true if winning_row?(axis_2)
    false
  end

  def winning_row?(row)
    row.uniq.count == 1 && row[0] != nil
  end
end
