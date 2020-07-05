module Mastermind
  class Game

    attr_reader :code_breaker_board, :code_master_board
    def initialize(input = {})
      @code_breaker_board = input.fetch(:board, Board.new({}))
      @code_master_board = input.fetch(:other_board, Board.new({}))
      @code_master_board.fill_cells_with_symbol("X")
      @SECRET_CODE = (CodeBreaker.new).PINS.values.shuffle
    end

    def play_game
      draw_board

      @SECRET_CODE.each do |el|
        print "#{el} "
      end
      puts "\n"
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

      (@SECRET_CODE.length).times { print "? ".(@SECRET_CODE[rand(@SECRET_CODE.length)]) }
      puts ""
      print "\t"
      puts ("@" * 26)
    end

  end
end
