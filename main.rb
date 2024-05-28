require './board'
require './game'
require './_vs_computer'

class Main
  def initialize
    @game = Game.new
  end

  def start
    puts "\nWelcome to the Mastermind game!"
    puts "Type 'P' to play against a person."
    puts "Type 'C' to play against the computer.\n"

    opponent = gets.chomp.upcase
    @game.check_opponent(opponent)
  end
end

main = Main.new
main.start
