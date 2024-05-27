class Board
  attr_accessor :game_colors, :rows_of_game, :code_pegs

  def initialize
    @game_colors = ["red", "blue", "green", "yellow", "white", "black"]
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
  attr_reader :players, :code_maker, :code_breaker

  MAX_ATTEMPTS = 10

  def initialize
    @code_maker = nil
    @code_breaker = nil
    @players = []
    @board = Board.new
  end

  def play_round
    attr_reader :opponent

    puts "\nWelcome to the Mastermind game!"
    puts "Type 'P' to play against a person."
    puts "Type 'C' to play against the computer.\n"

    opponent = gets.chomp.upcase
    cheak_opponent(opponent)

    def cheak_opponent(op)
      until op == "C" || opponent == "P"
        case op
        when "C"
          play_against_computer
        when "P"
          play_against_human
        else
          puts "ERROR, INVALID CHOICE"
        end
      end
    end
  end

  def play_against_human
    puts 'Enter Your Name PLayer One'
    player_one = gets.chomp.downcase
    @players << player_one

    puts 'Enter Your Name Player Two'
    player_two = gets.chomp.downcase
    @players << player_two

    @players[0] = @code_maker
    @players[1] = @code_braker

  puts "Game Started #{@players[0]} Is The Code Maker\n"
  code_maker(@players[0])

  puts "Game Started #{@players[1]} Is The Code Braker\n"
  code_braker(@players[1])

  end

  def code_maker(player)
    code = []
    getting_colrs = ""
    MAX_LENGTH == 4

    until code.length == MAX_LENGTH
      puts "#{player} choose from this colots #{@game_colors}"
      getting_colrs = STDIN.noecho(&:gets).chomp
      code << getting_colrs
    end
    @code_pegs = code.dup
  end

  def code_braker(player)
    attempts = Array.new(4)
    MAX_ATTEMPTS == 10
    puts "Hey, #{player} You Have 10 Attempts To Brake The Code\n"

    until attempts.eql?(@code_pegs) || attempts == MAX_ATTEMPTS
      puts "Enter First Color"
      attempts[0] = gets.chomp.downcase
      puts "Enter Second Color"
      attempts[1] = gets.chomp.downcase
      puts "Enter Third Color"
      attempts[2] = gets.chomp.downcase
      puts "Enter Fourth Color"
      attempts[3] = gets.chomp.downcase


  end

  def give_feedback(guessing_array, code_array)
    feedback_msg = ""
    feedback_msg_two = ""

    guessing_array.each_with_index do |color, index|
      code_array.each_with_index do |color, index|
        if quessing_array[index] == code_array[index]
          feedback_msg += 1
          puts "you have #{feedback_msg} colors in the same place"
        if color? {|color| color_match.include?(row)}
          feedback_msg_two += 1
          puts "you have #{feedback_msg_two} correct number but not in the correct place"

        else
          puts "you guess it wrong"
        end
    end
  end

  def play_against_computer
    role_vs_computer = ''
    player_name = ''

    puts "Enter Your  Name\n"
    player_name = gets.chomp.upcase

    puts "#{player_name} Type `1` if  you want to play as code maker\n"
    puts "#{player_name}} Type `2` if  you want to play as code braker\n"

    role_vs_computer = get.chomp.upcase

      if role_vs_computer == 1
        code_maker(player_name)
      if role_vs_computer == 2
        code_breaker(player_name)
      end

  end

  def computer_make_code

  end

  def compuuter_break_code

  end

end






game = Game.new
game.play_round


# board = Board.new
# board.display_board
