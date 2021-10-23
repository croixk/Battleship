require './lib/board'
require './lib/ship'
require './lib/cell'

def battleship_runner
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
  user_input = gets.chomp

  game_running = true
  while game_running

    if user_input == "p"
      player_board = Board.new
      computer_board = Board.new

      # computer makes board - figure out how to do this
      # come back to this - where do we do random computer board?

      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      player_board.render

      puts "Enter the squares for the Cruiser (3 spaces):"

      cruiser_squares = gets.chomp.split

      # require "pry"; binding.pry

      valid_cruiser = false
      while valid_cruiser == false
        cruiser = Ship.new("cruiser", 3)
        # require "pry"; binding.pry
        if player_board.valid_placement?(cruiser, cruiser_squares)
          player_board.place(cruiser, cruiser_squares)
          valid_cruiser = true
        elsif user_input == "q" # will this work
          game_running = false
        else
          puts "Those are invalid coordinates. Please try again:"
          cruiser_squares = gets.chomp.split
        end
      end

      player_board.render(true)


      ### copy above code for submarine

      # start game
      game_over = false
      while game_over != true
        puts"=============COMPUTER BOARD=========="
        computer_board.render

        puts"==============PLAYER BOARD=============="
        player_board.render

        puts"Enter the coordinate for your shot:"
        shot = gets.chomp

        # computer take shot

        puts""

        # if block - if ships have all sunk, set game_over to true

      end


    elsif user_input == "q" # will this work
      game_running = false
    end
  end

end

battleship_runner
