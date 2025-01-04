# Our Game class
class Game
  attr_accessor :board, :current_player_id

  def initialize(board, player1, player2)
    @board = board
    @players = [player1, player2]
    @current_player_id = 0
  end

  def current_player
    @players[current_player_id]
  end

  def switch_player
    @current_player_id = 1 - @current_player_id
  end

  def row_won?(row_index, player)
    counter = 0
    board.board[row_index].each do |marker|
      counter += 1 if marker == player.marker
      counter = 0 unless marker == player.marker

      return true if counter == 4
    end

    false
  end
end
