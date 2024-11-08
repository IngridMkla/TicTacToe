# ./spec/board_spec.rb
require 'rspec'
require_relative '../game/board'
require_relative '../game/game_play'

RSpec.describe Board do
  let(:board) { Board.new } # creation d'une instance de board pour les tests
  let(:gameplay) do
    game = Gameplay.new
    game.initialize_current_player
    game
  end
  it 'updates the board correctly' do
    board.update(gameplay, 'a1')
    expect(board.grid[0][1]).not_to eq('_')
  end
end
