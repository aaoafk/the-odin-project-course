module Mastermind
  class Board
    include Enumerable
    attr_reader :grid, :size
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
      @size = grid.length
    end

    def each(&block)
      @grid.each(&block)
    end

    def fill_cells_with_symbol(symbol)
      grid.each do |r|
        r.each do |cell|
          cell.value = symbol
        end
      end
    end

    private
    def default_grid
      Array.new(8) { Array.new(8) { Cell.new } }
    end

  end
end
