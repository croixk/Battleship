require './lib/cell'

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


end
