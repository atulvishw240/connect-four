# Implements our Player
class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def select_move
    loop do
      print "Enter your move between (1..7): "
      move = gets.chomp.to_i

      return move if move.between?(1, 7)

      puts "Erroneous input, Try again..."
      puts "\n"
    end
  end
end
