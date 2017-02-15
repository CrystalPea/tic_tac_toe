class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def play(hash)
    { row: hash[:row].downcase.to_sym,
     column: hash[:column].to_i}
  end
end
