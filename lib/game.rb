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
    assign_value(params)
    grid.change_field(params)
    raise "Game over! #{active_player.name} wins!" if grid.win?
    raise "Game over, it's a draw!" if grid.full?
    change_turn
  end

  private
  attr_writer :player_1, :player_2, :active_player, :grid

  def assign_value(params)
    if @active_player == player_1
      params[:value] = :x
    else params[:value] = :o
    end
  end

  def change_turn
    if active_player == player_1
      self.active_player = player_2
    else self.active_player = player_1
    end
  end
end
