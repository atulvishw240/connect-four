# Implements our board for our game
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, "\u{26AB}") }
  end

  def display
    puts "  1    2    3    4    5    6    7"
    puts "------------------------------------\n"

    board.each do |row|
      display_row(row)
    end
  end

  def display_row(row)
    print "|"
    row.each do |marker|
      print " #{marker} |"
    end

    puts "\n------------------------------------\n"
  end

  def update(move, player)
    row = avail_row(move)
    board[row][move - 1] = player.marker
  end

  def won?(row_index, col_index, player)
    bool1 = row_won?(row_index, player)
    bool2 = col_won?(col_index, player)
    bool3 = diagonal_won?(row_index, col_index, player)
    bool4 = rev_diagonal_won?(row_index, col_index, player)

    bool1 || bool2 || bool3 || bool4
  end

  # ---------------ALL PRIVATE METHODS BELOW----------------------------
  private

  def row_won?(row_index, player)
    counter = 0
    board[row_index].each do |marker|
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
      counter += 1 if board[row_index][col_index] == player.marker
      counter = 0 unless board[row_index][col_index] == player.marker

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
      if board[row_index][col_index] == player.marker
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
      if board[row_index][col_index] == player.marker
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

  def row_index(move)
    i = 0
    counter = 0
    while i < 6
      counter += 1 if board[counter][move - 1] == "\u{26AB}"

      i += 1
    end

    counter - 1
  end
end
