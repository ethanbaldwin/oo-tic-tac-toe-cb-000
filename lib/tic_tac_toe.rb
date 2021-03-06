class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def move(index, current_player)
      @board[index] = current_player
    end

    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter+=1
      end
    end
    return counter
  end

  def current_player
    counter = turn_count
    if counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      winning_position = []
      win_combination.each { |position| winning_position << @board[position]}
      if winning_position == ["X", "X", "X"] || winning_position == ["O", "O", "O"]
        return win_combination
      end
    end
    return false
  end

  def full?
   @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    if won? || !full?
      return false
    else
      return true
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
  return  @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
