class Computer
  attr_accessor :name, :game_level

  def initialize(name, game_level)
    @name = name
    @game_level = game_level

    @game_level = ''

    until game_level.include(%w[easy medium hard])

      puts "Okey, #{name}, Choose Level Of Game, Easy, Medium Or Hard"
      game_level = gets.chomp.downcase
      case game_level
      when "easy"
        @easy_mode
      when "medium"
        medium_mode
      when "hard"
        hard_mode
      else
        raise "Invalid choice, Try Again"
      end
    end
  end

  def play_easy_mode(computer_guessing)
    @board = Board.new


  end
end
