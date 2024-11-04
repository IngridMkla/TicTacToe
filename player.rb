# frozen_string_literal: true

require_relative 'game_play'

# handles players games rules
class Player
  attr_accessor :name, :icone

  @@piece = { player1: [], player2: [] }

  def initialize(name, icone)
    @name = name
    @icone = icone
  end

  # Checking if the position entered is right
  def position?(position)
    position.strip!
    return false unless position.length == 2

    row = position[0]
    row.upcase!
    return false unless ('A'..'C').include?(row)

    column = position[1]
    return false unless ('0'..'2').include?(column)

    true
  end

  # Playing logic
  def play(gameplay, board)
    puts "#{gameplay.current_player.name}, place your shot! : "

    position = ''

    loop do
      position = gets.chomp
      break unless !position?(position) || !board.occupied?(gameplay, position)
    end

    board.update(gameplay, position)

    placements_storage(gameplay, position)
  end

  # Insert placements of each player into an hash
  def placements_storage(gameplay, position)
    if gameplay.current_player.icone == gameplay.player1.icone
      @@piece[:player1] << position
    elsif gameplay.current_player.icone == gameplay.player2.icone
      @@piece[:player2] << position
    end
    puts @@piece
  end
end
