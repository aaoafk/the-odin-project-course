module Mastermind
  class Game

    attr_reader :code_breaker_board, :code_master_board
    def initialize(input = {})
      @code_breaker_board = input.fetch(:board, Board.new({}))
      @code_master_board = input.fetch(:other_board, Board.new({}))
      @code_master_board.fill_cells_with_symbol("X")
      @SECRET_CODE = (CodeBreaker.new).PINS.values.shuffle
      @PINS = (CodeBreaker.new).PINS
    end

    def play_game
      draw_board
      code_breaker_board.grid.each_with_index do |r, row_idx|
        new_guesses = (get_user_input)
        new_guesses.map! { |el| (el.match(/\_(.*)/))[0].tr('_', '').to_sym }
        new_guesses.each { |el| puts "#{el}"}
        r.each_with_index do |c, c_idx|
          new_value = @PINS[new_guesses[c_idx]]
          c.value = new_value
        end
        draw_board
      end
      draw_board
    end

    #Will handle drawing both the code_breaker_board and code_master_board seamlessly
    private
    def draw_board
      row_seperator = "-*-" * 13

      draw_coded_row
      puts row_seperator
      code_breaker_board.each_with_index do |r, r_idx|
        r.each_with_index do |cell, idx|
          print "#{cell.value} "
        end

        print " || "
        code_master_board.grid.at(r_idx).each do |_cell, _idx|
          print "#{_cell.value} "
        end

        puts "\n"
        puts row_seperator
      end
    end


    #responsible for drawing the coded row
    def draw_coded_row
      print "\t"
      puts ("&" * 26)
      print "\t\t"

      (@SECRET_CODE.length).times { print "? "}
      puts ""
      print "\t"
      puts ("@" * 26)
    end

    #responsible for handling whether the game has reached an end state
    def game_done?
      true
    end

    def get_user_input
      correct_input = false
      arr = []
      until correct_input
        say_how_to_input_guesses
        input = gets.chomp
        arr = input.split(',')
        arr.map! { |el| el.strip }
        arr.each do |e|
          print "#{e}, "
        end
        puts ""
        return arr if arr.length == 8
        correct_input = false
      end


    end

    def say_how_to_input_guesses
      result = [ ("bg_black".bg_black), ("bg_red".bg_red), ("bg_green".bg_green), ("bg_brown".bg_brown), ("bg_blue".bg_blue), ("bg_magenta".bg_magenta), ("bg_cyan".bg_cyan), ("bg_gray".bg_gray)]
      color_choice = {
        "bg_black" => result[0],
        "bg_red" => result[1],
        "bg_green" => result[2],
        "bg_brown" => result[3],
        "bg_blue" => result[4],
        "bg_magenta" => result[5],
        "bg_cyan" => result[6],
        "bg_gray" => result[7]
      }
      puts ""
      print "You need to input your guesses as one of these options: "
      color_choice.keys.each do |c|
        choice = color_choice[c]
        print "#{choice}"
        print ", "
      end
      puts "\nInput your pin colors seperated by commas, they'll be placed in the same order that you type your colors in e.g. -> bg_black,bg_blue,bg_cyan,..."
    end

  end
end
