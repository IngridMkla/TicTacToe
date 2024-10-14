class Game
  require_relative 'Board'
  require_relative 'Player'
  require_relative 'Player1'
  require_relative 'Player2'

  @@current_player
  @@winner

  attr_reader :player1, :player2
  attr_accessor :board

  def initialize()
    @board = Board.new
  end
  def start
    begin
      #players creation
      puts "Player 1, tap your name: "
      name1 = gets.chomp
      @player1 = Player1.new(name1)

      puts "Player 2, tap your name: "
      name2 = gets.chomp
      @player2 = Player2.new(name2)

      initialize_current_player

      begin
        #beginning of the game
        @@current_player.play
        switch_player

      end #while

    end while @board.is_Full?
  end

  def initialize_current_player
    if rand(2) == 0
      @@current_player = @player1
    else
      @@current_player = @player2
    end
  end
  def self.current_player
    @@current_player
  end

  def self.switch_player
    if @@current_player == @player1
      @@current_player = @player2
    else
      @@current_player = player1
    end
  end
end
