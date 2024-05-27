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
    puts "\nWelcome to the Mastermind game!"
    puts "Type 'P' to play against a person."
    puts "Type 'C' to play against the computer.\n"

    opponent = gets.chomp.upcase
    check_opponent(opponent)
  end

  def check_opponent(opponent)
    until opponent == "C" || opponent == "P"
      puts "ERROR, INVALID CHOICE"
      opponent = gets.chomp.upcase
    end

    case opponent
    when "C"
      play_against_computer
    when "P"
      play_against_human
    end
  end


  def play_against_human
    puts 'Enter Your Name Player One'
    player_one = gets.chomp.downcase
    @players << player_one

    puts 'Enter Your Name Player Two'
    player_two = gets.chomp.downcase
    @players << player_two

    @code_maker = @players[0]
    @code_breaker = @players[1]

    puts "Game Started #{@code_maker.capitalize} Is The Code Maker\n"
    code_maker(@code_maker)

    puts "Game Started #{@code_breaker.capitalize} Is The Code Breaker\n"
    code_breaker(@code_breaker)
  end



  def code_maker(player)
    code = []

    4.times do |i|
      puts "#{player.capitalize}, choose from these colors: #{@board.game_colors.join(', ')}"
      puts "enter color ##{i+1}"
      getting_colors = STDIN.noecho(&:gets).chomp
      if @board.game_colors.include?(getting_colors)
        code << getting_colors
      else
        puts "Invalid color choice. Please choose again."
        redo
      end
    end

    @board.code_pegs = code.dup
  end


  def code_breaker(player)
    attempts = []
    attempt_count = 0

    puts "Hey, #{player.capitalize}, you have #{MAX_ATTEMPTS} attempts to break the code\n"

    until attempts == @board.code_pegs || attempt_count >= MAX_ATTEMPTS
      guess = []
      puts "Enter your guess for the colors (4 colors needed)"
      4.times do |i|
        puts "Enter color ##{i+1}:"
        color = gets.chomp.downcase
        if @board.game_colors.include?(color)
          guess << color
        else
          puts "Invalid color choice. Please choose again."
          redo
        end
      end
      attempts = guess.dup
      attempt_count += 1
      give_feedback(guess, @board.code_pegs)
    end

    if attempts == @board.code_pegs
      puts "Congratulations, #{player.capitalize}! You broke the code!"
    else
      puts "Sorry, #{player.capitalize}, you've used all your attempts. The code was #{@board.code_pegs.join(', ')}"
    end
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
