module TicTacToe
  class Board

    attr_reader :grid
=begin
    input will default to an empty hash if it's not given.
    here we're relying on the fetch, with a default behavior
    if the `:grid` symbol cannot be called we enter our default grid
    method to establish the default board we expect to use in tictactoe
=end
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    private
    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
