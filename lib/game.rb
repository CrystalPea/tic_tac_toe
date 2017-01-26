require_relative "tictactoe_grid"
require_relative "player"

class Game
  attr_reader :player_1, :player_2, :active_player, :grid

  def initialize(player1, player2, grid)
    @player_1 = player1
    @player_2 = player2
    @active_player = player_1
    @grid = grid
  end

  def play(params)
    return "This field is taken" if grid.field_taken?(params)
    grid.change_field(params)
    raise "Game over! #{active_player.name} wins!" if grid.win?
    change_turn
  end

  private
  attr_writer :player_1, :player_2, :active_player, :grid

  def change_turn
    if active_player == player_1
      self.active_player = player_2
    else self.active_player = player_1
    end
  end
end
