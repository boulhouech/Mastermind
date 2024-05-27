require 'io/console'

class Board
  attr_accessor :game_colors, :rows_of_game, :code_pegs

  def initialize
    @game_colors = ["red", "blue", "green", "yellow", "white", "black"]
    @rows_of_game = Array.new(10) { Array.new(4, " ") }
    @code_pegs = []
  end

  def display_board
    @rows_of_game.each do |row|
      puts row.map { |color| color.ljust(10) }.join("|")
    end
  end

  def update_board(attempt_number, guess)
    @rows_of_game[attempt_number] = guess
  end

  def show_board
    display_board
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
    @attempts = []
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
      puts "Enter color ##{i+1}:"
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
    attempt_count = 0

    puts "Hey, #{player.capitalize}, you have #{MAX_ATTEMPTS} attempts to break the code\n"

    until @attempts == @board.code_pegs || attempt_count >= MAX_ATTEMPTS
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

      @attempts = guess.dup
      @board.update_board(attempt_count, guess)
      attempt_count += 1
      give_feedback(guess, @board.code_pegs)
      @board.show_board
    end

    if @attempts == @board.code_pegs
      puts "Congratulations, #{player.capitalize}! You broke the code!"
    else
      puts "Sorry, #{player.capitalize}, you've used all your attempts. The code was #{@board.code_pegs.join(', ')}"
    end
  end

  def give_feedback(guessing_array, code_array)
    feedback_msg = 0
    feedback_msg_two = 0

    guessing_array.each_with_index do |color, index|
      if color == code_array[index]
        feedback_msg += 1
      elsif code_array.include?(color)
        feedback_msg_two += 1
      end
    end

    puts "You have #{feedback_msg} color(s) in the correct place."
    puts "You have #{feedback_msg_two} color(s) correct but in the wrong place."
  end

  def play_against_computer
    role_vs_computer = ''
    player_name = ''

    puts "Enter Your Name\n"
    player_name = gets.chomp.upcase

    until role_vs_computer == 1 || role_vs_computer == 2


    puts "#{player_name} Type `1` if you want to play as code maker\n"
    puts "#{player_name} Type `2` if you want to play as code breaker\n"

    role_vs_computer = gets.chomp.to_i

    if role_vs_computer == 1
      code_maker(player_name)
      computer_break_code
    elsif role_vs_computer == 2
      computer_make_code
      code_breaker(player_name)
    else
      puts "Invalid Choice, Try Again"
    end
  end
  end

  def computer_make_code
    computer_code = @board.game_colors.sample(4)
    @board.code_pegs = computer_code.dup
  end

  def computer_break_code
    # Implementation for the computer to break the code
  end
end

game = Game.new
game.play_round
