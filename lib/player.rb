# Implements our Player
class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def select_move
    print "Enter your move between (1..7): "
    gets.chomp.to_i
  end
end
