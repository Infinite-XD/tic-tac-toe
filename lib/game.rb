# Game Class, contains all the logic required for the game to actually function
class Game
  attr_accessor :board, :player1, :player2

  def initialize(player1, player2, board)
    @board = board
    @player1 = player1
    @player2 = player2
    @game_over = false
  end

  def display
    puts "  1   2    3"
    ("A".."C").each_with_index do |letter, index|
      puts "#{letter} #{board.board[index][0]} | #{board.board[index][1]} | #{board.board[index][2]}"
    end
  end

  def play # rubocop:disable Metrics/MethodLength
    current = 0
    while @game_over == false
      display
      puts "\nEnter a move: "
      move_pos = gets.chomp
      if current.zero?
        player1.move(move_pos)
        current = 1
      else
        player2.move(move_pos)
        current = 0
      end
    end
  end
end
