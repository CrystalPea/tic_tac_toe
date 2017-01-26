class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def play(row, column, value)
    {row: row.downcase.to_sym,
     column: column.to_i,
     value: value.downcase.to_sym}
  end
end
