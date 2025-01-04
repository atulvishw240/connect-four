require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

board = Board.new
player1 = Player.new("Atul", "\u{1F534}")
player2 = Player.new("Gaurav", "\u{1F535}")
game = Game.new(board, player1, player2)

board.board[1][3] = player1.marker
board.board[2][4] = player1.marker
board.board[3][5] = player1.marker
board.board[4][6] = player1.marker

puts game.diagonal_won?(4, 6, player1)
