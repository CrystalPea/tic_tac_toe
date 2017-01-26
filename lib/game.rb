class Game
  attr_reader :player_1, :player_2, :active_player, :grid

  def initialize(player1, player2, grid)
    @player_1 = player1
    @player_2 = player2
    @active_player = player_1
    @grid = grid
  end

  def play
    active_player.play
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
