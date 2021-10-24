require './lib/game'

RSpec.describe 'Game' do
  it 'is an instance of Game' do
    current_game = Game.new()
    expect(current_game).to be_instance_of(Game)
  end
  



end
