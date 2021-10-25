require './lib/game'

RSpec.describe 'Game' do
  it 'is an instance of Game' do
    current_game = Game.new()
    expect(current_game).to be_instance_of(Game)
  end

  it 'can read player_board object' do
    current_game = Game.new()
    expect(current_game.player_board).to be_instance_of(Board)
  end

  it 'can read computer_board object' do
    current_game = Game.new()
    expect(current_game.computer_board).to be_instance_of(Board)
  end

  it 'can read game-specific ship instance (player_cruiser)' do
    current_game = Game.new()
    expect(current_game.player_cruiser).to be_instance_of(Ship)
  end

  it 'can read game-specific ship instance (player_sub)' do
    current_game = Game.new()
    expect(current_game.player_sub).to be_instance_of(Ship)
  end

  it 'can read game-specific ship instance (computer_cruiser)' do
    current_game = Game.new()
    expect(current_game.computer_cruiser).to be_instance_of(Ship)
  end

  it 'can read game-specific ship instance (computer_sub)' do
    current_game = Game.new()
    expect(current_game.computer_cruiser).to be_instance_of(Ship)
  end

  it 'can return appropriate is_game_over? value' do
    current_game = Game.new()
    current_game.player_cruiser.hit
    current_game.player_cruiser.hit
    current_game.player_cruiser.hit
    current_game.player_sub.hit
    current_game.player_sub.hit
    expect(current_game.is_game_over?). to be true
  end

  it 'computer board has both ships' do
    current_game = Game.new()
    current_game.place_computer_ships

    expect(current_game.computer_board.has_ships?).to be true
  end

end
