require_relative 'game_play'

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
    return false unless ("A".."C").include?(row)

    column = position[1]
    return false unless ("0".."2").include?(column)

    return true
  end

  def play(board)

    puts "#{Gameplay.current_player.name}, placez votre coup! : "
    begin
      pos = gets.chomp
    end while !is_position(pos) || !board.is_occupied(pos)

    board.update(pos) #update the board ... (update(pos))

    if Gameplay.current_player.icone == 'O'
      @@piece[:player1] << pos
    elsif Gameplay.current_player.icone == 'X'
      @@piece[:player2] << pos
    end

    puts @@piece

  end
end
