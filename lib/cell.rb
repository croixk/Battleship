class Cell

  attr_reader = :position, :cell_state, :current_ship

  def initialize(position)
    @position = position.to_s
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

end
