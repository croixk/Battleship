require './lib/ship'

RSpec.describe Ship do
  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  it 'is not sunk' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'is hit - health drops' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it 'is hit again - health drops again' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(1)
  end

  it 'is still not sunk' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
  end

  it 'is sunk' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end

end
