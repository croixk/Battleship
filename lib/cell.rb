class Cell

  attr_reader = :position, :cell_state, :current_ship

  def initialize(position)
    @position = position
    @cell_state = '.' # All cells start empty ('.')
    @current_ship = nil
    @fired_state = false # Dictates whether or not we can all '.fire_upon' on a given cell

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

  def fire_upon
    if @fired_state == false # Check to see if we can fire on this cell
      if @current_ship == nil # Register as miss if no ship exists on cell
        @cell_state = 'M'
        @fired_state = true
      elsif @current_ship != nil and @current_ship.sunk? == false# If any ship exists on a given cell, register as a hit
        @cell_state = 'H'
        @current_ship.hit
        @fired_state = true
      elsif @current_ship.sunk? == true
        @cell_state = 'X'
        @fired_state = true
      end
    end
  end

  def place_ship(ship) # Update internal value
    @current_ship = ship
  end

  def current_cell_state # Return cell_state
    @cell_state
  end

  def render(optional_boolean)
    if optional_boolean != true # Will show cell_state
      @cell_state
    else
      if @current_ship != nil # Will display 'S' if a ship exists on cell & optional boolean is true
        @cell_state = 'S'
      end
    end
  end
end
