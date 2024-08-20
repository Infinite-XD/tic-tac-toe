require_relative "lib/board"
require_relative "lib/player"

board = Board.new

puts board.check_vertical([["X", "", ""], ["X", "", ""], ["X", " ", "X"]])
