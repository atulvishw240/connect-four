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

  def switch_player!
    @current_player_id = 1 - @current_player_id
  end

  def winning_message(player)
    "#{player.name} won the Game!!"
  end

  def draw_message
    "The game ended in draw!!"
  end

  def play
    board.display
    counter = 0
    while counter <= 41
      move = current_player.select_move
      row_index = board.row_index(move)
      col_index = move - 1
      board.update(move, current_player)
      board.display

      if board.won?(row_index, col_index, current_player)
        puts winning_message(current_player)
        return
      end

      switch_player!
    end

    puts draw_message
  end
end
