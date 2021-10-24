# Our 'board' require contains other required files
require './lib/board'

class Game

  attr_reader :player_board, :computer_board, :player_cruiser, :player_sub, :computer_cruiser, :computer_sub
  def initialize
    @player_board = Board.new()
    @computer_board = Board.new()
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
  end

  def place_player_cruiser

  end


end
