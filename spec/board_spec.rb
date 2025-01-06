require_relative "../lib/board"
require_relative "../lib/player"

describe Board do

  before(:each) do
    @board = Board.new
    @player1 = Player.new("Atul", "\u{1F534}")
  end

  describe "#display_row" do
    it "takes a row from our board array as input and displays it" do
      $stdout = StringIO.new
      @board.display_row(@board.board[0])
      $stdout.rewind

      expect($stdout.gets).to eq("| \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} | \u{26AB} |\n")
      expect($stdout.gets).to eq("------------------------------------\n")
    end
  end

  describe "#row_won" do
    it "takes row_index as input & returns true if there are 4 consecutive same marker in a row" do
      @board.board[0][0] = @player1.marker
      @board.board[0][1] = @player1.marker
      @board.board[0][2] = @player1.marker
      @board.board[0][3] = @player1.marker

      expect(@board.won?(0, 3, @player1)).to eq(true)
    end

    it "takes row_index as input & returns false if there aren't 4 consecutive same marker in a row" do
      @board.board[0][1] = @player1.marker
      @board.board[0][3] = @player1.marker
      @board.board[0][4] = @player1.marker
      @board.board[0][5] = @player1.marker

      expect(@board.won?(0, 5, @player1)).to eq(false)
    end

    it "returns true" do
      @board.board[0][2] = @player1.marker
      @board.board[0][3] = @player1.marker
      @board.board[0][4] = @player1.marker
      @board.board[0][5] = @player1.marker

      expect(@board.won?(0, 5, @player1)).to eq(true)
    end
  end

  describe "#col_won?" do
    it "returns true if there are 4 consecutive marker in a column" do
      @board.board[1][0] = @player1.marker
      @board.board[2][0] = @player1.marker
      @board.board[3][0] = @player1.marker
      @board.board[4][0] = @player1.marker

      expect(@board.won?(4, 0, @player1)).to eq(true)
    end

    it "returns false because there are'nt 4 consecutive marker in a column" do
      @board.board[1][0] = @player1.marker
      @board.board[3][0] = @player1.marker
      @board.board[4][0] = @player1.marker
      @board.board[5][0] = @player1.marker

      expect(@board.won?(5, 0, @player1)).to eq(false)
    end
  end

  describe "#diagonal_won?" do
    it "returns true if there are 4 consecutive same marker in a diagonal" do
      @board.board[0][0] = @player1.marker
      @board.board[1][1] = @player1.marker
      @board.board[2][2] = @player1.marker
      @board.board[3][3] = @player1.marker

      expect(@board.won?(3, 3, @player1)).to eq(true)
    end

    it "returns false if there are'nt 4 consecutive same marker in a diagonal" do
      @board.board[0][0] = @player1.marker
      @board.board[2][2] = @player1.marker
      @board.board[3][3] = @player1.marker
      @board.board[4][4] = @player1.marker

      expect(@board.won?(4, 4, @player1)).to eq(false)
    end

    it "returns true if there are 4 consecutive same marker in a diagonal" do
      @board.board[1][3] = @player1.marker
      @board.board[2][4] = @player1.marker
      @board.board[3][5] = @player1.marker
      @board.board[4][6] = @player1.marker

      expect(@board.won?(4, 6, @player1)).to eq(true)
    end
  end

  describe "#rev_diagonal_won?" do
    it "returns true if there are 4 consecutive same marker in a reverse diagonal" do
      @board.board[0][4] = @player1.marker
      @board.board[1][3] = @player1.marker
      @board.board[2][2] = @player1.marker
      @board.board[3][1] = @player1.marker

      expect(@board.won?(3, 1, @player1)).to eq(true)
    end

    it "returns false if there are'nt 4 consecutive same marker in a reverse diagonal" do
      @board.board[0][4] = @player1.marker
      @board.board[2][2] = @player1.marker
      @board.board[3][1] = @player1.marker
      @board.board[4][0] = @player1.marker

      expect(@board.won?(4, 0, @player1)).to eq(false)
    end

    it "returns true if there are 4 consecutive same marker in a diagonal" do
      @board.board[2][6] = @player1.marker
      @board.board[3][5] = @player1.marker
      @board.board[4][4] = @player1.marker
      @board.board[5][3] = @player1.marker

      expect(@board.won?(5, 3, @player1)).to eq(true)
    end
  end

  describe "#update" do
    it "updates board with player's move" do
      allow(@player1).to receive(:select_move) { 1 }
      @board.update(1, @player1)

      expect(@board.board[5][0]).to eq(@player1.marker)
    end

    it "updates board with player's move in the same column" do
      @board.board[5][0] = @player1.marker
      allow(@player1).to receive(:select_move) { 1 }
      @board.update(1, @player1)

      expect(@board.board[4][0]).to eq(@player1.marker)
    end
  end
end
