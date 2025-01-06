# Implements our Player
class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def select_move
    print "Enter your move separated by space(1 2), where 1 represent row and 2 represent column: "
    move = gets.chomp.split
    move.map(&:to_i)
  end
end