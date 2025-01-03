require_relative "../lib/board"

describe Board do

  before(:each) do
    @board = Board.new
  end

  describe "#display_row" do
    it "takes a row from our board array as input and displays it" do
      $stdout = StringIO.new
      @board.display_row(@board.board[0])
      $stdout.rewind

      # expect($stdout.gets).to eq("-----------------------------\n")
      expect($stdout.gets).to eq("| \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} |\n")
      expect($stdout.gets).to eq("-----------------------------\n")
    end
  end
end