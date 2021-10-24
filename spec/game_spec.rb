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




end
