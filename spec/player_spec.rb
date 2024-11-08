# ./spec/player_spec.rb
require 'rspec'
require_relative '../game/player'

RSpec.describe Player do
  let(:player) { Player.new('Test', 'X') } # creation d'une instance de board pour les tests

  it 'checks correct positions' do
    expect(player.position?('a1')).to be true
    # expect(player.position?('d4')).to be false
  end
end
