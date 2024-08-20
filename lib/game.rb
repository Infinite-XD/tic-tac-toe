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

  def getpos
    letters = %w[A B C]
    numbers = %w[1 2 3]
    move_pos = gets.chomp
    while move_pos.length != 2 || !letters.include?(move_pos[0].upcase) || !numbers.include?(move_pos[1])
      puts "\nEnter a VALID move: "
      move_pos = gets.chomp
    end
    move_pos
  end

  def play # rubocop:disable Metrics/MethodLength
    current = 0
    while @game_over == false
      display
      puts "\nEnter a move: "
      move_pos = getpos
      if current.zero?
        taken = player1.move(move_pos)
        current = 1 if taken == true
      else
        taken = player2.move(move_pos)
        current = 0 if taken == true
      end
      @game_over = @board.final_check(board.board)
    end
    if current.zero?
      puts "Player 1 wins!"
    else
      puts "Player 2 wins!"
    end
  end
end
