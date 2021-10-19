class Cell

  attr_reader = :position, :cell_state, :current_ship

  def initialize(position)
    @position = position
    @cell_state = '.' # All cells start empty ('.')
    @current_ship = nil
    @fired_state = false

  end

  def empty? # Check if cell is in empty state
    if @current_ship == nil
      true
    else
      false
    end
  end

  def coordinate # Read cell position
    @position
  end

  def ship # Read ship on current cell
    @current_ship
  end

  def fired_upon? # Read whether cell has been fired upon
    @fired_state
  end

  def place_ship(ship) # Update internal value
    @current_ship = ship
  end

end
