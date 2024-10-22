# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# This class handles the main logic of the game
class Gameplay
  attr_reader :player1, :player2
  attr_accessor :board, :current_player

  def initialize
    (1..2).each do |i|
      get_player_name(i)
    end

    @board = Board.new
    @player1 = Player.new(@name1, 'O')
    @player2 = Player.new(@name2, 'X')
  end

  def get_player_name(index)
    puts "Player #{index}, enter your name: "
    instance_variable_set("@name#{index}", gets.chomp)
  end

  def start
    initialize_current_player
    print @board.display

    until @board.full? == true || check_winner != false
      # beginning of the game
      @current_player.play(self, @board)
      switch_player
      print @board.display
    end

    return unless check_winner != false

    puts check_winner
  end

  def initialize_current_player
    @current_player = if rand(2).zero?
                        @player1
                      else
                        @player2
                      end
  end

  def switch_player
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  def check_winner
    if @board.winner?(self) == @player1.icone
      "\nOMG, WHAT A CRACK!\n#{@player1.name}, YOU WOOOOOON \u{1F60E}!\n\nBahaha #{@player2.name},
      What A Loo..Ser...\nYou lost. \u{1F480}"
    elsif @board.winner?(self) == @player2.icone
      "\nOMG, WHAT A CRACK!\n#{@player2.name}, YOU WOOOOOON \u{1F60E}!\n\nBahaha #{@player1.name},
      What A Loo..Ser...\nYou lost. \u{1F480}"
    else
      false
    end
  end
end
