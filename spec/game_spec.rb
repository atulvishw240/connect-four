require_relative "../lib/board"
require_relative "../lib/player"
require_relative "../lib/game"

describe do

  before(:each) do
    @board = Board.new
    @player1 = Player.new("Atul", "\u{1F534}")
    @player2 = Player.new("Gaurav", "\u{1F535}")
    @game = Game.new(@board, @player1, @player2)
  end

  describe "#current_player" do
    it "returns @player1 because @player1 will get the first turn in every game" do

      expect(@game.current_player).to eq(@player1)
    end
  end

  describe "#switch_player" do
    it "returns @player2 as current player" do
      @game.switch_player!

      expect(@game.current_player).to eq(@player2)
    end
  end
end
