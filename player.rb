require_relative 'placements'
class Player
  attr_accessor :name
  include Placements
  @@piece = {
    player1: [],
    player2: []}
  def initialize(name)
    @name = name
  end

  def play

    puts "Placez votre coup! : "
    begin
    pos = gets.chomp
    end while !is_position(pos)
    #we're going to update the board ... (update(pos))
    #(...).update(pos)
    if Game.current_player == @player1
      @@piece[:player1] << pos
    else
      @@piece[:player2] << pos
    end

    puts @@piece

  end
end
