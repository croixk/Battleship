require './lib/computer'
require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Computer do
  it 'exists' do
    computer = Computer.new()
    expect(computer).to be_instance_of(Computer)
  end

  it 'can select random valid placement (cruiser)' do
    board = Board.new()
    cruiser = Ship.new("Cruiser", 3)
    computer = Computer.new()

    expect(board.valid_placement?(cruiser, computer.random_cruiser_position)).to eq true
  end

  it 'can select random valid placement (submarine)' do
    board = Board.new()
    submarine = Ship.new("Submarine", 2)
    computer = Computer.new()

    expect(board.valid_placement?(submarine, computer.random_sub_position)).to eq true
  end

  it 'can select a random cell' do
    board = Board.new()
    submarine = Ship.new("Submarine", 2)
    computer = Computer.new()
    require 'pry'; binding.pry
    expect(board.valid_coordinate?(computer.random_fire)).to eq true
  end

end
