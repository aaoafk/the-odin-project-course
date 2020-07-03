RSpec.describe TicTacToe do
  it "has a version number" do
    expect(TicTacToe::VERSION).not_to be nil
  end

  it "sets the grid with three rows by default" do
    board = TicTacToe::Board.new({})
    expect(board.grid).to have(3).things
  end

  it "is initialized with a value of '' by default" do
    cell = TicTacToe::Cell.new
    expect(cell.value).to eq ''
  end
=begin
  it "tests that the PLayer class will raise an exception when initialized with an invalid Hash." do
    expect(TicTacToe::Player.new({})).to raise_error
  end

  it "tests that we CAN create a Player class with a valid hash" do
    expect(TicTacToe::Player.new(Hash.new(color: "X", name: "Someone"))).to_not raise_error
  end

  it "tests that we can get the attributes that we have attr_readers set for" do
    player = TicTacToe::Player.new(Hash.new(color: "X", name: "Someone"))
    expect(player.color).to eq "X"
  end

  it "tests that we can get the attributes that we have attr_readers set for" do
    player = TicTacToe::Player.new(Hash.new(color: "X", name: "Someone"))
    expect(player.name).to eq "Someone"
  end
        When testing the default_grid, we don't want our tests to be closely coupled with the
        data structure specified in the method (i.e. an Array with three nested Arrays and
        each nested Array must have three Cell objects). Tests should focus on behavior, not
        internal data structures.
  it "tests that the construction of a board is generally correct" do
    board = TicTacToe::Board.new
    expect(board.grid).to have(3).things
  end

  it "creates three things in each row by default" do
    board = TicTacToe::Board.new
    board.grid.each do |r|
      expect(row).to have(3).things
    end
  end
=end
end
