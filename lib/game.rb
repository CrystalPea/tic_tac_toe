require_relative "board"
require_relative "player"

class Game
  attr_reader :player_1, :player_2, :active_player, :board

  def initialize(player1, player2, board)
    @player_1 = player1
    @player_2 = player2
    @active_player = player_1
    @board = board
  end

  def play(params)
    return "This field is taken" if board.field_taken?(params)
    return "No cheating!" unless board.field_exists?(params)
    assign_value(params)
    board.change_field(params)
    game_over?
    change_turn
  end

  private
  attr_writer :player_1, :player_2, :active_player, :board

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

  def game_over?
    abort "Game over! #{active_player.name} wins!" if board.win?
    abort "Game over, it's a draw!" if board.full?
  end
end
