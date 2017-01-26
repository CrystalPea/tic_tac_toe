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
    grid.each {|row| return true if row.uniq.count == 1 && row[0] != nil }
    sideways = [[], [], []]
    grid.each {|row| sideways[0] << row[0]; sideways[1] << row[1]; sideways[2] << row[2] }
    sideways.each {|row| return true if row.uniq.count == 1 && row[0] != nil }

    false
  end

  private
  attr_accessor :a, :b, :c
end
