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
end
