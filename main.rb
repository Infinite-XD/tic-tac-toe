require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

board = Board.new
player1 = Player.new(board, "X")
player2 = Player.new(board, "Y")
game = Game.new(player1, player2, board)

game.play
