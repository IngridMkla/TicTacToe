class Game
  @@current_player
  @@winner
  attr_reader :player1, :player2
  attr_accessor :board
  def initialize()

    @board = Board.new
  end
  def start
    begin
      #on creer les joueurs
      puts "Joueur 1, saisiseez votre nom: "
      joueur1 = gets.chomp
      @player1 = Player.new(joueur1)

      puts "Joueur 2, saisiseez votre nom: "
      joueur2 = gets.chomp
      @player2 = Player.new(joueur2)

    end while is_Full?
  end
end
