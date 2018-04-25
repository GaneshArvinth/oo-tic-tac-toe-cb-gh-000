class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

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

  def move(index,symbol)
    @board[index] = symbol
  end

  def position_taken?(index)

    if(@board[index] == "X" || @board[index] == "O")
      return true
    else
      return false
    end

  end

  def valid_move?(index)

    if(!index.between?(0,8))
      return false
    elsif(position_taken?(index) == true)
      return false
    else
      return true
    end

  end

  def turn_count
    count = 0

    @board.each do |elements|

      if(elements == "X" || elements == "O")
        count+=1
      end

    end

    return count

  end

  def current_player

    player = turn_count

    if(turn_count%2 == 0)
      return "X"
    else
      return "O"
    end

  end

  def turn
    puts "Enter a value"
    user_input = gets.strip
    index = input_to_index(user_input)
    symbol = current_player

    if(valid_move?(index) == true)
      move(index,symbol)
      display_board
    else
      turn
    end

  end

  def won?
    index = 0

    while(index<8)
      arrayX = Array.new
      arrayO = Array.new

      WIN_COMBINATIONS[index].each do |combination|

        if(@board[combination] == "X")
          arrayX << combination
        elsif(@board[combination] == "O")
          arrayO << combination
        end

      end

      if(arrayX == WIN_COMBINATIONS[index])
        return arrayX
      elsif(arrayO == WIN_COMBINATIONS[index])
        return arrayO
      end

      index+=1

    end

    return false
  end

  def full?

    index = 0
    count = 0

    while(index<9)

      if(@board[index] == " ")
        count+=1
      end

      index+=1
    end

    if(count == 0)
      return true
    else
      return false
    end

  end

  def draw?

    full = full?
    won = won?

    if(won == false && full == true)
      return true
    else
      return false
    end

  end

  def over?

    draw = draw?
    won = won?
    full = full?

    if(draw == true || won == true || full == true)
      return true
    else
      return false
    end

  end

  def winner

    index = 0

    while (index<8)
      countX = 0
      countO = 0

      WIN_COMBINATIONS[index].each do |combination|

        if(@board[combination] == "X")
          countX+=1
        elsif(@board[combination] == "O")
          countO+=1
        end

        if(countX == 3)
          return "X"
        elsif(countO == 3)
          return "O"
        end

      end

      index+=1
    end

  end

  def play

    turn

    over = over?
    won = won?

    if(over == true && won == true)
      return winner
    elsif(over == false && won == false)
      play
    elsif(over == true && won == false)
      draw?
    end

  end

end
