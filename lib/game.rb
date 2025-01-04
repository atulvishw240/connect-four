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

  def col_won?(col_index, player)
    counter = 0
    row_index = 0
    while row_index < 6
      counter += 1 if board.board[row_index][col_index] == player.marker
      counter = 0 unless board.board[row_index][col_index] == player.marker

      return true if counter == 4

      row_index += 1
    end

    false
  end

  def diagonal_won?(row_index, col_index, player)
    until row_index.zero? || col_index.zero?
      row_index -= 1
      col_index -= 1
    end

    counter = 0
    until row_index == 6 || col_index == 7
      if board.board[row_index][col_index] == player.marker
        counter += 1
      else
        counter = 0
      end

      row_index += 1
      col_index += 1

      return true if counter == 4
    end

    false
  end

  def rev_diagonal_won?(row_index, col_index, player)
    until row_index == 0 || col_index == 6
      row_index -= 1
      col_index += 1
    end

    counter = 0
    until row_index == 6 || col_index == -1
      if board.board[row_index][col_index] == player.marker
        counter += 1
      else
        counter = 0
      end

      row_index += 1
      col_index -= 1

      return true if counter == 4
    end

    false
  end
end
