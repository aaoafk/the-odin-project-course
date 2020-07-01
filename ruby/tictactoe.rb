class Board
  def initialize(p1, p2)
    @board = Array.new(3) { Array.new(3) }
    #Honestly this looks like it should be moved into a player class, players can play on boards, I could hard code it but?
    @p1 = p1
    @p2 = p2
    @p1_moves = Array.new
    @p2_moves = Array.new
    @curr_player = "PLAYER_1"
    @available_spots = Array.new { Hash.new }
  end

  public
  def init_spots
    @board.each_with_index do |r, r_idx|
      r.each_with_index do |c, c_idx|
        @available_spots << {r_idx => c_idx}
      end
    end
  end

  #Rudimentary print_board function good enough for now lol
  
  def print_board
    @board.each_with_index do |r, r_idx|
      r.each_with_index do |c, c_idx|
        unless c == nil
          print "#{c}\t"
        else
          print "#{r_idx}, #{c_idx}\t"
        end
      end
      puts "\n"
    end
  end

  def get_availablility(r, c, symbol)
    choices = Array.new
    first_row = @available_spots[0...3]
    second_row = @available_spots[3...6]
    third_row = @available_spots[6..8]
    choices << first_row << second_row << third_row
    cell = choices[r][c]
    p cell[r]
    unless cell[r] == nil
      @available_spots[r][c] = nil
      @board[r][c] = "#{symbol}"
      return true
    end
    false
  end

  def get_symbol(player)
    player == "PLAYER_1" ? @p1 : @p2
  end

  def play_game
    won = false
    until won
      play_round
      won = player_won?(get_symbol(@curr_player))
    end
  end

  def play_round
    player = which_turn?(@curr_player)
    puts "#{player} it's your turn to go \n"
    puts "Choose a spot from the grid below. Which row do you want to go? Select one of (0,1,2): \n"
    row = gets.chomp
    row = row.to_i
    puts "Choose a column that you want to go (0,1,2)"
    col = gets.chomp
    col = col.to_i
    res = get_availablility(row, col, get_symbol(player))
    until res
      puts "Sorry that spot's been taken, please try again."
      puts "Choose a spot from the grid below. Which row do you want to go? Select one of (0,1,2): \n"
      row = gets.chomp
      row = row.to_i
      puts "Choose a column that you want to go (0,1,2)"
      col = gets.chomp
      col = col.to_i
      res = get_availablility(row, col, get_symbol(player))
    end
    print_board
  end

  def which_turn?(curr_player)
    res = curr_player == "PLAYER_1" ? "PLAYER_2" : "PLAYER_1"
    @curr_player = res
    res
  end

  def player_won?(symbol)
    if @board[0][0] == symbol && @board[0][1] == symbol && @board[0][2] == symbol
      true
    elsif @board[1][0] == symbol && @board[1][1] == symbol && @board[1][2] == symbol
      true
    elsif @board[2][0] == symbol && @board[2][1] == symbol && @board[2][2] == symbol
      true
    elsif @board[0][0] == symbol && @board[1][0] == symbol && @board[2][0] == symbol
      true
    elsif @board[0][1] == symbol && @board[1][1] == symbol && @board[2][1] == symbol
      true
    elsif @board[0][2] == symbol && @board[1][2] == symbol && @board[2][2] == symbol
      true
    elsif @board[0][0] == symbol && @board[1][1] == symbol && @board[2][2] == symbol
      true
    elsif @board[0][2] == symbol && @board[1][1] == symbol && @board[2][0] == symbol
      true
    else
      false
    end
  end

end

puts "Welcome to terminal tic tac toe!"
puts "Player 1 do you want to be O or X?"
p1_symbol = gets.chomp
until p1_symbol == "O" or p1_symbol == "X" do
  puts "Sorry #{p1_symbol} isn't a valid choice"
  p1_symbol = gets.chomp
end
puts "\n"

#Player 2 gets whatever player 1 didn't choose
p2_symbol = (p1_symbol == "O") ? "X" : "O"

board = Board.new(p1_symbol, p2_symbol)
board.print_board
board.init_spots
board.play_game
