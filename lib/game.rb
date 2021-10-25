# Our 'board' require contains other required files
require './lib/board'
require './lib/computer'

class Game

  attr_reader :computer, :player_board, :computer_board, :player_cruiser, :player_sub, :computer_cruiser, :computer_sub
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

  # Request user input for ship locations - continue to prompt until valid input is given

  def place_player_ships

    @player_board.render(true)

    puts "Enter the squares for the Cruiser (3 space):"
    cruiser_squares = gets.chomp.split

    valid_cruiser = false
    while valid_cruiser == false
      # require "pry"; binding.pry
      if player_board.valid_placement?(@player_cruiser, cruiser_squares)
        player_board.place(@player_cruiser, cruiser_squares)
        valid_cruiser = true
      else
        puts "Those are invalid coordinates. Please try again:"
        cruiser_squares = gets.chomp.split
      end
    end

    puts "Enter the squares for the Submarine (2 spaces):"
    submarine_squares = gets.chomp.split

    valid_submarine = false
    while valid_submarine == false
      # submarine = Ship.new("submarine", 2)
      # require "pry"; binding.pry
      if player_board.valid_placement?(@player_sub, submarine_squares)
        player_board.place(@player_sub, submarine_squares)
        valid_submarine = true

      else
        puts "Those are invalid coordinates. Please try again:"
        submarine_squares = gets.chomp.split
      end
    end
  end

  # Place computer ships at valid locations - continue randomly selecting from provided positions until valid one is found
  def place_computer_ships

    valid_cruiser = false
    while valid_cruiser == false
      cruiser_squares = @computer.random_cruiser_position
      if computer_board.valid_placement?(@computer_cruiser, cruiser_squares)
        computer_board.place(@computer_cruiser, cruiser_squares)
        valid_cruiser = true
      end
    end

    valid_submarine = false
    while valid_submarine == false
      submarine_squares = @computer.random_sub_position
      if computer_board.valid_placement?(@computer_sub, submarine_squares)
        computer_board.place(@computer_sub, submarine_squares)
        valid_submarine = true
      end
    end
  end

  def take_turn
    valid_player_shot = false # Ask player for valid target - do not continue until valid input is given
    puts"Enter the coordinate for your shot:"
    shot = gets.chomp

    until valid_player_shot == true
      if @computer_board.valid_coordinate?(shot)
        valid_player_shot = true
        @computer_board.cells[shot].fire_upon
      else
        puts "Please enter a valid coordinate."
        shot = gets.chomp
      end
    end

    valid_computer_shot = false # Same as above, but automated by computer random method
    until valid_computer_shot == true
      random_coordinate = @computer.random_fire
      if @player_board.valid_coordinate?(random_coordinate)
        valid_computer_shot = true
        @player_board.cells[random_coordinate].fire_upon
      else
        valid_computer_shot = false
      end
    end

    # Display most up-to-date boards after player and computer turns
    puts"=============COMPUTER BOARD=========="
    @computer_board.render

    puts"==============PLAYER BOARD=============="
    @player_board.render(true)


    # player statement depending on whether shot hit or missed
    if @computer_board.cells[shot].current_cell_state == "H"
      puts "\n\n Your shot on #{shot} was a hit."
    elsif @computer_board.cells[shot].current_cell_state == "M"
      puts "\n\n Your shot on #{shot} was a miss."
    else @computer_board.cells[shot].current_cell_state == "X"
      puts "\n\n Your shot on #{shot} sunk the ship."
    end

    # computer statement depending on whether shot hit or missed
    if @player_board.cells[random_coordinate].current_cell_state == "H" || @player_board.cells[random_coordinate].current_cell_state == "S"
      puts "My shot on #{random_coordinate} was a hit. \n\n"
    elsif @player_board.cells[random_coordinate].current_cell_state == "M"
      puts "My shot on #{random_coordinate} was a miss. \n\n"
    else @player_board.cells[random_coordinate].current_cell_state == "X"
      puts "My shot on #{random_coordinate} sunk the ship. \n\n"
    end
  end


  # Display end results when a given player wins
  def is_game_over?
    if @computer_cruiser.sunk? && @computer_sub.sunk?
      game_over = true
      puts"=============COMPUTER BOARD=========="
      @computer_board.render

      puts"==============PLAYER BOARD=============="
      @player_board.render(true)

      puts"\nYou won!\n\n"

      return true

    elsif @player_cruiser.sunk? && @player_sub.sunk?
      game_over = true
      puts"=============COMPUTER BOARD=========="
      @computer_board.render

      puts"==============PLAYER BOARD=============="
      @player_board.render(true)

      puts"\nI won!\n\n"

      return true

    else
      return false

    end

  end


end
