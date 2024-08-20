# Board Class, generates 2D array simulating a tic-tac-toe board.
class Board
  attr_accessor :board

  def initialize
    @board = Board.create_board
  end

  def self.create_board
    Array.new(3) { Array.new(3, " ") }
  end

  def check_victory(arr)
    true if arr.all? { |item| item == "X" } || arr.all? { |item| item == "Y" }
  end

  def check_horizontal(arr)
    arr.each do |item|
      return true if item.all? { |inner_item| inner_item == "X" } || item.all? { |inner_item| inner_item == "Y" }
    end
    false
  end

  def check_vertical(arr)
    temp = []
    3.times do |num|
      3.times do |number|
        temp.push(arr[number][num])
      end
      p temp
      return true if check_victory(temp) == true

      temp = []
    end
    false
  end

  def check_diagnol(arr) # rubocop:disable Metrics/MethodLength
    temp = []
    3.times do |number|
      temp.push(arr[number][number])
    end
    return true if check_victory(temp) == true

    p temp
    temp = []
    reversed_arr = arr.reverse
    3.times do |number|
      temp.push(reversed_arr[number][number])
    end
    p temp
    return true if check_victory(temp) == true

    false
  end
end
