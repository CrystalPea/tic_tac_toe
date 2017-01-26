class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def play(row, column)
    {row: row.downcase.to_sym, column: column.to_i}
  end
end
