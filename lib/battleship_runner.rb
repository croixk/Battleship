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

      current_game.place_computer_ships
      current_game.place_player_ships

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


        if current_game.player_board.valid_coordinate?(current_game.computer.random_fire)
          #fire upon
          current_game.player_board.cells[current_game.computer.random_fire].fire_upon
        end

    
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
