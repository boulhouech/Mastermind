class Board
  attr_accessor :game_colors, :rows_of_game, :code_pegs

  def initialize
    @game_colors = ["%red", "blue", "green", "yellow", "white", "black"]
    @rows_of_game = Array.new(10) { Array.new(4) }
    @code_pegs = []
  end

  def display_board
    @rows_of_game.each do |row|
      puts row.inspect
    end
  end
end

class Game
  def initialize
    @code_maker = code_maker
    @code_braker = code_braker
    @players = []
  end
  #while free_rows false

  def play_round
    attr_reader :opponent

    puts "\nWelcome to the Mastermind game!"
    puts "Type 'P' to play against a person."
    puts "Type 'C' to play against the computer.\n"

    opponent = gets.chomp.upcase
    cheak_opponent(opponent)

    def cheak_opponent(player)
      until opponent == "C" || opponent == "P"
        case opponent
        when "C"
          play_against_computer
        when "P"
          play_against_human
        else
          puts "ERROR, INVALID CHOICE"
        end
      end
    end

    def play_against_human
      puts "Enter Your Name PLayer One"
      player_one = gets.chomp.downcase
      @players << player_one
    end

    end








  end











  #def current_player(player)

  #end

  #end


end
end



game = Game.new
game.play_round


# board = Board.new
# board.display_board
