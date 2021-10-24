require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

def battleship_runner
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
  user_input = gets.chomp

  game_running = true
  while game_running

    if user_input == "p"
      current_game = Game.new()

      # computer makes board - figure out how to do this
      # come back to this - where do we do random computer board?

      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      current_game.place_player_ships
      # computer_board.render
      #
      # puts "Enter the squares for the Cruiser (3 spaces):"
      #
      # cruiser_squares = gets.chomp.split

      # require "pry"; binding.pry

      # valid_cruiser = false
      # while valid_cruiser == false
      #   cruiser = Ship.new("cruiser", 3)
      #   # require "pry"; binding.pry
      #   if computer_board.valid_placement?(cruiser, cruiser_squares)
      #     computer_board.place(cruiser, cruiser_squares)
      #     valid_cruiser = true
      #   elsif user_input == "q" # will this work
      #     game_running = false
      #   else
      #     puts "Those are invalid coordinates. Please try again:"
      #     cruiser_squares = gets.chomp.split
      #   end
      # end

      # player_board.render(true)

      # place submarine
      # puts "Enter the squares for the Submarine (2 spaces):"
      #
      # submarine_squares = gets.chomp.split
      #
      # # require "pry"; binding.pry
      #
      # valid_submarine = false
      # while valid_submarine == false
      #   submarine = Ship.new("submarine", 2)
      #   # require "pry"; binding.pry
      #   if computer_board.valid_placement?(submarine, submarine_squares)
      #     computer_board.place(submarine, submarine_squares)
      #     valid_submarine = true
      #   elsif user_input == "q" # will this work
      #     game_running = false
      #   else
      #     puts "Those are invalid coordinates. Please try again:"
      #     submarine_squares = gets.chomp.split
      #   end
      # end

      # start game
      game_over = false
      while game_over != true
        puts"=============COMPUTER BOARD=========="
        current_game.computer_board.render

        puts"==============PLAYER BOARD=============="
        current_game.player_board.render(true)
        # require "pry"; binding.pry
        puts"Enter the coordinate for your shot:"
        shot = gets.chomp

        # this should be computer board - can change once we have that
        if current_game.computer_board.valid_coordinate?(shot)
          #fire upon
          current_game.computer_board.cells[shot].fire_upon
        end

        # computer take shot

        # if block - if ships have all sunk, set game_over to true
        # game is over if player ship 1 and 2 are sunk, or computer 1 and 2
        if current_game.computer_cruiser.sunk? && current_game.computer_sub.sunk?
          game_over = true
          puts"=============COMPUTER BOARD=========="
          current_game.computer_board.render

          puts"==============PLAYER BOARD=============="
          current_game.player_board.render

          puts"game over"
          return 0
        end

        # 2nd block to end game , 2nd outcome

      end


    elsif user_input == "q" # will this work
      game_running = false
    end
  end

end

battleship_runner
