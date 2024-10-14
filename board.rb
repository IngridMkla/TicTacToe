require_relative 'placements'
class Board
  include Placements
  attr_accessor :grid
  @@shot = {}
  @@shot_counter = 0
  def initialize
    @grid = Array.new(3){Array.new(3,"_")}
  end

  #update method (a chaque fois qu'un joueur joue on actualise la grille)
  def update(pos)

    @@shot_counter += 1

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

  end
  #isFull method (si la grille est totalement remplie apres le tour d'un joueur, le jeu s'arrete)
  def isFull?
    return false unless @@shot_counter != 9
    true
  end
end

A = Board.new
A.display
