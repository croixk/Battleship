require './lib/board'
require './lib/ship'


RSpec.describe Board do
    # will want to use before each to keep file shorter
  before (:each) do
    @board = Board.new()
  end

  it 'is a valid coordinate - A1' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
  end

  it 'is a valid coordinate - D4' do
    expect(@board.valid_coordinate?("D4")).to eq(true)
  end

  it 'is a valid coordinate - A5' do
    expect(@board.valid_coordinate?("A5")).to eq(false)
  end

  it 'is a valid coordinate - E1' do
    expect(@board.valid_coordinate?("A1")).to eq(false)
  end


  it 'is a valid coordinate - A22' do
    expect(@board.valid_coordinate?("A1")).to eq(false)
  end


  # it 'is a valid placement - length' do
  #   expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
  # end
  #
  #
  # it 'is a valid placement - length' do
  #   expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  # end
  #
  # it 'is a valid placement - consecutive' do
  #   expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
  # end
  #
  # it 'is a valid placement - consecutive' do
  #   expect(@board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  # end
  #
  # it 'is a valid placement - consecutive' do
  #   expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  # end
  #
  # it 'is a valid placement - consecutive' do
  #   expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  # end
  #
  # it 'is a valid placement - diagonal' do
  #   expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
  # end
  #
  # it 'is a valid placement - diagonal' do
  #   expect(@board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  # end
  #
  # it 'is a valid placement - final check' do
  #   expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(false)
  # end
  #
  # it 'is a valid placement - final check' do
  #   expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(false)
  # end

  ##### PICK UP HERE WITH TESTS FOR 'PLACING SHIPS' SECTION



end
