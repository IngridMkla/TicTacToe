require_relative 'game_play'

# handles players games rules
class Player
  attr_accessor :name, :icone

  @@piece = { player1: [], player2: [] }

  def initialize(name, icone)
    @name = name
    @icone = icone
  end

  def is_position(position)
    position.strip!
    return false unless position.length == 2

    row = position[0]
    row.upcase!
    return false unless ('A'..'C').include?(row)

    column = position[1]
    return false unless ('0'..'2').include?(column)

    true
  end

  def play(gameplay, board)
    puts "#{gameplay.current_player.name}, place your shoot! : "
    begin
      position = gets.chomp
    end while !is_position(position) || !board.occupied?(gameplay, position)

    board.update(gameplay, position) # update the board ... (update(pos))

    if gameplay.current_player.icone == gameplay.player1.icone
      @@piece[:player1] << position
    elsif gameplay.current_player.icone == gameplay.player2.icone
      @@piece[:player2] << position
    end

    puts @@piece
  end
end
