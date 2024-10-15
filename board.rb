require_relative 'game_play'

class Board
  attr_accessor :grid
  @@shot_counter = 0
  def initialize
    @grid = Array.new(3){Array.new(3,"_")}
  end

  def position_to_coordinates(pos)
    pos.strip!
    x = pos[0].upcase
    y = pos[1].to_i

    case x
    when "A"
      x = 0
    when "B"
      x = 1
    when "C"
      x = 2
    else
      raise "Error: Invalid row"
    end
    return x,y
  end

  #update method (a chaque fois qu'un joueur joue on actualise la grille)
  def update(pos)
    row, column = position_to_coordinates(pos)
    @grid[row][column] = Gameplay.current_player.icone
    @@shot_counter += 1
  end

  def is_occupied(pos)
    row, column = position_to_coordinates(pos)
    if @grid[row][column] != "_"
      print "This position is already set.
      \nChoose another one!
      \n#{Gameplay.current_player.name}, set your shot: "
      return false
    else
      return true
    end
  end

  #display method (affichage de la grille de jeu)
  def display
    ordinate = ["A","B","C"]
    @grid.each_with_index do |tab,i|
      print "#{ordinate[i]}"
      tab.each do |j|
        print "|#{j}"
      end
      puts
    end
    print " |0|1|2\n"
    puts
    puts "shot_counter: #{@@shot_counter}"
  end

  #isFull method (si la grille est totalement remplie apres le tour d'un joueur, le jeu s'arrete)
  def isFull
    return false unless @@shot_counter == 9
    return true
  end

  def isWinner?
    #check every row
    @grid.each do |row|
      if row.all? {|piece| piece == 'O'} || row.all?{ |piece| piece == 'X'}
        return row[0] #winning icone
      end
    end
    #check every column
    (0..2).each do |column|
      if @grid.all? {|row| row[column] == 'O' } || @grid.all? {|row| row[column] == 'X' }
        return @grid[0][column] #winning icone
      end
    end
    #check both diagonal left+right
    #left
    if (0..2).all? { |i| @grid[i][i] == 'O' } || (0..2).all? { |i| @grid[i][i] == 'X'}
      return @grid[0][0]
    end
    #right
    if (0..2).all? { |i| @grid[i][2-i] == 'O' } || (0..2).all? { |i| @grid[i][2-i] == 'X'}
      return @grid[0][2]
    end
    return false
  end
end

=begin
A = Board.new
A.grid[0][0] = A.grid[1][1] = A.grid[2][2] = 'X'
puts A.isWinner?
=end
