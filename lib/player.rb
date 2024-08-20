# Player Class, controls basic player functions eg. move
class Player
  attr_accessor :board, :id

  def initialize(board, playerid)
    @id = playerid
    @board = board
  end

  def pos_finder(pos)
    pos_arr = pos.chars
    case pos_arr[0]
    when "A"
      pos_arr[0] = 0
    when "B"
      pos_arr[0] = 1
    when "C"
      pos_arr[0] = 2
    end
    pos_arr
  end

  def move(pos)
    position = pos_finder(pos)
    @board.board[position[0]][position[1].to_i - 1] = id
  end
end
