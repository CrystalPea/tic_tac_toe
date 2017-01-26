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

  def win?
    return true if horizontal_win?
    return true if vertical_win?
    return true if diagonal_win?
    false
  end

  private
  attr_accessor :a, :b, :c

  def horizontal_win?
    grid.each {|row| return true if row.uniq.count == 1 && row[0] != nil }
    false
  end

  def vertical_win?
    sideways = [[], [], []]
    grid.each {|row| sideways[0] << row[0]; sideways[1] << row[1]; sideways[2] << row[2] }
    sideways.each {|row| return true if row.uniq.count == 1 && row[0] != nil }
    false
  end

  def diagonal_win?
    axis_1 = [a[0], b[1], c[2]]
    return true if axis_1.uniq.count == 1 && axis_1[0] != nil
    axis_2 = [c[0], b[1], a[2]]
    return true if axis_2.uniq.count == 1 && axis_2[0] != nil
    false
  end
end
