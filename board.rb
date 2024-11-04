# frozen_string_literal: true

require_relative 'game_play'

# This class handles displays of the board
class Board
  attr_accessor :grid, :shot_counter

  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
    @shot_counter = 0
  end

  # Transforms a letter, into an index used for coordinates
  def letter_to_index(letter)
    case letter.upcase
    when 'A' then 0
    when 'B' then 1
    when 'C' then 2
    else
      raise 'Error: Invalid row'
    end
  end

  # Transforms the position entered, into coordinates
  def position_to_coordinates(pos)
    pos.strip!
    x = letter_to_index(pos[0])
    y = pos[1].to_i
    [x, y]
  end

  # Update the board each time a player make a move
  def update(gameplay, position)
    row, column = position_to_coordinates(position)
    @grid[row][column] = gameplay.current_player.icone
    @shot_counter += 1
  end

  # Check if a position is occupied
  def occupied?(gameplay, position)
    row, column = position_to_coordinates(position)
    return true unless @grid[row][column] != '_'

    print "This position is already set.
      \nChoose another one!
      \n#{gameplay.current_player.name}, set your shot: "
    false
  end

  # display method (affichage de la grille de jeu)
  def display
    ordinate = %w[A B C]
    @grid.each_with_index do |row, i|
      print(ordinate[i])
      row.each { |j| print "|#{j}" }
      puts
    end
    print " |0|1|2\n"
  end

  # full? method (si la grille est totalement remplie apres le tour d'un joueur, le jeu s'arrete)
  def full?
    return false unless @shot_counter == 9

    true
  end

  # check if there is any winner
  def winner?(gameplay)
    check_rows(gameplay) || check_columns(gameplay) || check_diagonals(gameplay)
  end

  # check every row
  def check_rows(gameplay)
    @grid.each do |row|
      return row[0] if  row.all? { |piece| piece == gameplay.player1.icone } ||
                        row.all? { |piece| piece == gameplay.player2.icone } # winning icone
    end
    nil
  end

  # check every column
  def check_columns(gameplay)
    (0..2).each do |column|
      return @grid[0][column] if @grid.all? { |row| row[column] == gameplay.player1.icone } ||
                                 @grid.all? { |row| row[column] == gameplay.player2.icone } # winning icone
    end
    nil
  end

  # check both diagonal (left and right)
  def check_diagonals(gameplay)
    [left_diagonal, right_diagonal].each do |diagonal|
      return diagonal[0] if winning_diagonal?(diagonal, gameplay)
    end
    nil
  end

  def left_diagonal
    (0..2).map { |i| @grid[i][i] } # left
  end

  def right_diagonal
    (0..2).map { |i| @grid[i][2 - i] } # right
  end

  def winning_diagonal?(diagonal, gameplay)
    diagonal.all? { |piece| piece == gameplay.player1.icone } ||
      diagonal.all? { |piece| piece == gameplay.player2.icone }
  end
end

# A = Board.new
# A.grid[0][0] = A.grid[1][1] = A.grid[2][2] = 'X'
# puts A.winner?
