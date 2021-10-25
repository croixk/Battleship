require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

# computer hits same cells more than once /user can hit same cell more than once (SOLVED)
# can't quit from final page - can only quit before playing game
# can't render a hit when showing own ships (with boolean)
# after taking a shot = need to display message (SOLVED)
# doesn't ask again if you enter coordinate wrong (SOLVED)
# report who won/lost (SOLVED)
# add comments to pull requests (eventually)
# error if you enter incorrect coordinate to place (SOLVED)



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

      current_game.place_computer_ships
      current_game.place_player_ships

      game_over = false
      while game_over != true
        puts"=============COMPUTER BOARD=========="
        current_game.computer_board.render

        puts"==============PLAYER BOARD=============="
        current_game.player_board.render
        # require "pry"; binding.pry

        # TEMPORARILY COMMENTED
        # puts"Enter the coordinate for your shot:"
        # shot = gets.chomp

        current_game.take_turn

        # if block - if ships have all sunk, set game_over to true
        # game is over if player ship 1 and 2 are sunk, or computer 1 and 2

        if current_game.is_game_over?
          battleship_runner
        end
        # if current_game.computer_cruiser.sunk? && current_game.computer_sub.sunk?
        #   game_over = true
        #   puts"=============COMPUTER BOARD=========="
        #   current_game.computer_board.render
        #
        #   puts"==============PLAYER BOARD=============="
        #   current_game.player_board.render
        #
        #   puts"game over"
        #
        #   battleship_runner
        # end

        # 2nd block to end game , 2nd outcome

      end


    elsif user_input == "q" # will this work
      game_running = false
    end
  end

end

battleship_runner
