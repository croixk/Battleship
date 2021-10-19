class Cell

  attr_reader = :position, :cell_state, :current_ship

  def initialize(position)
    @position = position.to_s
    @cell_state = '.' # All cells start empty ('.')
    @current_ship = nil

  end

  def empty? # Check if cell is in empty state
    if @cell_state == '.'
      true
    else
      false
    end
  end

  def place_ship(ship)

  end

end
