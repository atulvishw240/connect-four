require_relative "../lib/player"
require_relative "../lib/board"

describe Player do

  before(:each) do
    @player = Player.new("Atul", "\u{1F534}")
  end

  describe "#select_move" do
    it "player's move should update the board" do
      allow(@player).to receive(:select_move).and_return([1, 2])
      move = @player.select_move

      expect(move).to eq([1, 2])
    end
  end
end