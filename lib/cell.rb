class Cell

  attr_reader = :position, :cell_state, :current_ship

  def initialize(position)
    @position = position
    @cell_state = '.' # All cells start empty ('.')
    @current_ship = nil

  end

  def empty? # Check if cell is in empty state
    if @current_ship == nil
      true
    else
      false
    end
  end

  def coordinate
    @position
  end

  def ship
    @current_ship
  end

end
