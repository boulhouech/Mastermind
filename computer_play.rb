class Computer
  class Computer
    attr_accessor :name, :game_level
    MAX_ATTEMPTS = 10

    def initialize(name, game_level)
      @name = name
      @game_level = game_level

      @game_level = ''

      until %w[easy medium hard].include?(game_level)
        puts "Okay, #{name}, choose the level of the game: Easy, Medium, or Hard"
        game_level = gets.chomp.downcase
        case game_level
        when "easy"
          play_easy_mode
        when "medium"
          play_medium_mode
        when "hard"
          play_hard_mode
        else
          raise "Invalid choice, try again"
        end
      end
    end

    def play_easy_mode
      @board = Board.new
      track_of_guessing = []
      code_to_break = @board.code_pegs.dup
      computer_attempts = 0

      until computer_attempts >= MAX_ATTEMPTS
        computer_attempts += 1
        computer_guess = generate_guess(track_of_guessing)
        track_of_guessing << computer_guess

        puts "Computer's guess: #{computer_guess}"
        puts "White peg means correct color in the wrong place."
        puts "Red peg means correct color in the correct place."
        puts "Enter feedback in the format: [number of red pegs] [number of white pegs]."
        puts "For example, '2 1' means 2 colors are correct and in the right place, and 1 color is correct but in the wrong place."

        user_feedback = gets.chomp
        red_pegs, white_pegs = user_feedback.split.map(&:to_i)

        break if red_pegs == code_to_break.length

        puts "Computer attempts: #{computer_attempts}"
      end
    end

    ef play_medium_mode
    @board = Board.new
    track_of_guessing = []
    code_to_break = @board.code_pegs.dup
    computer_attempts = 0

    until computer_attempts >= MAX_ATTEMPTS
      computer_attempts += 1
      computer_guess = generate_guess_medium(track_of_guessing, code_to_break)
      track_of_guessing << computer_guess

      puts "Computer's guess: #{computer_guess}"
      puts "White peg means correct color in the wrong place."
      puts "Red peg means correct color in the correct place."
      puts "Enter feedback in the format: [number of red pegs] [number of white pegs]."
      puts "For example, '2 1' means 2 colors are correct and in the right place, and 1 color is correct but in the wrong place."

      user_feedback = gets.chomp
      red_pegs, white_pegs = user_feedback.split.map(&:to_i)

      break if red_pegs == code_to_break.length

      puts "Computer attempts: #{computer_attempts}"
    end
  end
end
