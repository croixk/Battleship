require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("A1")

    expect(cell).to be_instance_of(Cell)
  end

  it 'can check if cell is empty' do
    cell = Cell.new("A1")

    expect(cell.empty?).to be true
  end

  it 'can read cell position' do
    cell = Cell.new("A1")

    expect(cell.coordinate).to eq("A1")
  end

  it 'can read current ship type' do
    cell = Cell.new("A1")

    expect(cell.ship).to eq nil
  end

  it 'can read fired_state' do
    cell = Cell.new("A1")

    expect(cell.fired_upon?).to be false
  end

  it 'can place a given ship' do
    cell = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
  end


end
