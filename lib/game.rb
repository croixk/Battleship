# Our 'board' require contains other required files
require './lib/board'

class Game

  attr_reader :player_board, :computer_board, :player_cruiser, :player_sub, :computer_cruiser, :computer_sub
  def initialize

    # Initialize computer instance
    @computer = Computer.new()

    # Initialize game boards
    @player_board = Board.new()
    @computer_board = Board.new()

    # Initialize ship instances
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
  end

  def place_player_ships

    @player_board.render

    puts "Enter the squares for the Cruiser (3 space):"

    cruiser_squares = gets.chomp.split

    valid_cruiser = false

    while valid_cruiser == false
      # require "pry"; binding.pry
      if player_board.valid_placement?(@player_cruiser, cruiser_squares)
        player_board.place(cruiser, cruiser_squares)
        valid_cruiser = true
      elsif user_input == "q" # will this work
        game_running = false
      else
        puts "Those are invalid coordinates. Please try again:"
        cruiser_squares = gets.chomp.split
      end
    end

    puts "Enter the squares for the Submarine (2 spaces):"

    submarine_squares = gets.chomp.split

    # require "pry"; binding.pry

    valid_submarine = false
    while valid_submarine == false
      submarine = Ship.new("submarine", 2)
      # require "pry"; binding.pry
      if computer_board.valid_placement?(submarine, submarine_squares)
        computer_board.place(submarine, submarine_squares)
        valid_submarine = true
      elsif user_input == "q" # will this work
        game_running = false
      else
        puts "Those are invalid coordinates. Please try again:"
        submarine_squares = gets.chomp.split
      end
    end
  end


end
