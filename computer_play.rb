class Computer
  attr_accessor :name, :game_level
  MAX_ATTEMPTS = 10

  def initialize(name, game_level)
    @name = name
    @game_level = game_level

    @game_level = ''

    until game_level.include(%w[easy medium hard])

      puts "Okey, #{name}, Choose Level Of Game, Easy, Medium Or Hard"
      game_level = gets.chomp.downcase
      case game_level
      when "easy"
        play_easy_mode
      when "medium"
        play_medium_mode
      when "hard"
        play_hard_mode
      else
        raise "Invalid choice, Try Again"
      end
    end
  end

  def play_easy_mode(computer_guessing)
    @board = Board.new
    track_of_guessing = []
    code_to_brake = @board.code_pegs.dup
    computer_attempts = 0

    until computer_attempts >= MAX_ATTEMPTS
      computer_attempts += 
      puts "White peg means correct color in the wrong place."
      puts "Red peg means correct color in the correct place."
      puts "Enter feedback in the format: [number of red pegs] [number of white pegs]."
      puts "For example, '2 1' means 2 colors are correct and in the right place, and 1 color is correct but in the wrong place."

      user_feedback = gets.chomp.downcase
      red_pegs, white_pegs = feedback.split.map(&:to_i)


      until user_feedback.include?(%[0 1 2 3 4])
        puts ""



      end

    end



  end
end
