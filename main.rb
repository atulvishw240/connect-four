require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

board = Board.new
player1 = Player.new("Atul", "\u{1F534}")
player2 = Player.new("Gaurav", "\u{1F535}")
game = Game.new(board, player1, player2)
