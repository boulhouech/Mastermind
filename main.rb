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

board = Board.new
board.display_board
