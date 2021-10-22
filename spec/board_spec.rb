require './lib/board'
require './lib/ship'
require './lib/cell'


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

    expect(@board.valid_coordinate?("E1")).to eq(false)
  end


  it 'is a valid coordinate - A22' do
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end


  it 'is a valid placement - length' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
  end


  it 'is a valid placement - length' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'is a valid placement - consecutive -8 ' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
  end

  it 'is a valid placement - consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  end

  it 'is a valid placement - consecutive -10' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  end

  it 'is a valid placement - consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'is a valid placement - diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
  end

  it 'is a valid placement - diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  it 'is a valid placement - final check - 14' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(false)
  end

  it 'is a valid placement - final check' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(false)
  end

  # 
  # it 'place ship A1 - does ship associated with cell equal ship' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   board.place(cruiser, ["A1", "A2", "A3"])
  #   cell_1 = board.cells["A1"]
  #   cell_2 = board.cells["A2"]
  #   cell_3 = board.cells["A3"]
  #   expect(@board.cells["A1"].ship).to eq(cruiser)
  # end
  #
  # it 'place ship A2 - does ship associated with cell equal ship' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   board.place(cruiser, ["A1", "A2", "A3"])
  #   cell_1 = board.cells["A1"]
  #   cell_2 = board.cells["A2"]
  #   cell_3 = board.cells["A3"]
  #   expect(@board.cells["A1"].ship).to eq(cruiser)
  # end
  #
  # it 'place ship A3 - does ship associated with cell equal ship' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   board.place(cruiser, ["A1", "A2", "A3"])
  #   cell_1 = board.cells["A1"]
  #   cell_2 = board.cells["A2"]
  #   cell_3 = board.cells["A3"]
  #   expect(@board.cells["A1"].ship).to eq(cruiser)
  # end
  #
  #




end
