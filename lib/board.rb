class Board

  attr_reader

  def initialize

    @cells = {
      "A1" => cell_1 = Cell.new('A1'),
      "A2" => cell_2 = Cell.new("A2"),
      "A3" => cell_3 = Cell.new("A3"),
      "A4" => cell_4 = Cell.new("A4"),
      "B1" => cell_5 = Cell.new("B1"),
      "B2" => cell_6 = Cell.new("B2"),
      "B3" => cell_7 = Cell.new("B3"),
      "B4" => cell_8 = Cell.new("B4"),
      "C1" => cell_9 = Cell.new("C1"),
      "C2" => cell_10 = Cell.new("C2"),
      "C3" => cell_11 = Cell.new("C3"),
      "C4" => cell_12 = Cell.new("C4"),
      "D1" => cell_13 = Cell.new("D1"),
      "D2" => cell_14 = Cell.new("D2"),
      "D3" => cell_15 = Cell.new("D3"),
      "D4" => cell_16 = Cell.new("D4")
    }

  end

  def valid_coordinate?(cell_coordinates)
    cell_coordinates = cell_coordinates.split!(//)
    letter = cell_coordinates[0]
    number = cell_coordinates[1]
    # complete this
    if ("A".."Z").include?(letter) && (1..4).include?(number)
      return true
    else
      return false
    end
  end



  def valid_placement?(ship_name, ship_cells)
    # number of coordinates
    letters = []
    numbers = []

    ship_cells.each do |cell|
      coordinates = cell.split(//)
      letter << cell_coordinates[0]
      number << cell_coordinates[1]
    end

    if ship_length != ship_cell.length
      return false
    # consecutive coordinates
    elsif
      return false
    # diagonal check
    elsif
      return false
    else
      return true
    end
  end

  def place

  end


  def render
    print ("  1 2 3 4 ")
    print ("A " + @cells["A1"].cell_state + ' ' + @cells["A2"].cell_state + ' ' + @cells["A3"].cell_state + ' ' + @cells["A4"].cell_state)
    print ("B " + @cells["B1"].cell_state + ' ' + @cells["B2"].cell_state + ' ' + @cells["B3"].cell_state + ' ' + @cells["B4"].cell_state)
    print ("C " + @cells["C1"].cell_state + ' ' + @cells["C2"].cell_state + ' ' + @cells["C3"].cell_state + ' ' + @cells["C4"].cell_state)
    print ("D " + @cells["C1"].cell_state + ' ' + @cells["D2"].cell_state + ' ' + @cells["D3"].cell_state + ' ' + @cells["D4"].cell_state)

  end

end
