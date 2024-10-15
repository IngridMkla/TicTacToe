require_relative 'player'
require_relative 'board'

class Gameplay
  @@current_player

  attr_reader :player1, :player2
  attr_accessor :board

  def initialize()
    (1..2).each do |i|
      get_player_name(i)
    end

    @board = Board.new
    @player1 = Player.new(@name1,'O')
    @player2 = Player.new(@name2,'X')
  end

  def get_player_name(i)
    puts "Player #{i}, enter your name: "
    instance_variable_set("@name#{i}", gets.chomp)
  end

  def start
    initialize_current_player
    print @board.display

    until @board.isFull == true || check_winner != false
      #beginning of the game
      @@current_player.play(@board)
      switch_player
      print @board.display
    end

    if check_winner != false
      puts check_winner
    elsif
      puts "Game 0ver: Nobody Won \u{1F480}"
    end
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

  def switch_player
    if @@current_player == @player1
      @@current_player = @player2
    else
      @@current_player = @player1
    end
  end

  def check_winner
    if @board.isWinner? == @player1.icone
      return "\nOMG, WHAT A CRACK!\n#{@player1.name}, YOU WOOOOOON \u{1F60E}!\n\nBahaha #{@player2.name}, What A Looser...\nYou lost. \u{1F480}"
    elsif @board.isWinner? == @player2.icone
      return "\nOMG, WHAT A CRACK!\n#{@player2.name}, YOU WOOOOOON \u{1F60E}!\n\nBahaha #{@player1.name}, What A Looser...\nYou lost. \u{1F480}"
    else
      return false
    end
  end
end
