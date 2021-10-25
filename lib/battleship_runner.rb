require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

# Refactor valid_placement?
# Write is_game_over? test
# Write valid_computer_placement test

def battleship_runner

  game_running = true
  while game_running
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    user_input = gets.chomp

    if user_input == "p"
      current_game = Game.new()

      # computer makes board - figure out how to do this
      # come back to this - where do we do random computer board?

      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      current_game.place_computer_ships
      current_game.place_player_ships

      puts"=============COMPUTER BOARD=========="
      current_game.computer_board.render

      puts"==============PLAYER BOARD=============="
      current_game.player_board.render(true)

      game_over = false
      while game_over != true

        current_game.take_turn

        # if block - if ships have all sunk, set game_over to true
        # game is over if player ship 1 and 2 are sunk, or computer 1 and 2

        if current_game.is_game_over?
          game_over = true
        end

      end


    elsif user_input == "q" # will this work
      game_running = false
    end
  end

end

battleship_runner
