require 'rspec'
require_relative '../game/game_play'

RSpec.describe GamePlay do
  # let(:game_play) do # creation d'une instance de gameplay pour les tests
  #   game = GamePlay.new
  #   game.initialize_current_player
  #   game
  # end

  subject(:game_play) { GamePlay.new }
  let(:player) { Player.new('Toto', 'X') }
  it 'initializes the game with two players' do
    expect(game_play.player1).not_to be_nil
    # expect(game.player2).not_to be_nil
  end
  it 'checks if there is a winner' do
    game.board.update(game, 'a0')
    game.board.update(game, 'b1')
    game.board.update(game, 'c2')
    expect(game.check_winner).not_to be false
  end
end
