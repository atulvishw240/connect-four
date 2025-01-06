# Implements our board for our game
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, "\u{26AB}") }
  end

  def display
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
end
