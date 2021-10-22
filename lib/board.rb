require'./lib/cell'
require './lib/ship'

class Board

  attr_reader :cells

  def initialize
    @cell_1 = Cell.new('A1')
    @cell_2 = Cell.new('A2')
    @cell_3 = Cell.new('A3')
    @cell_4 = Cell.new('A4')
    @cell_5 = Cell.new('B1')
    @cell_6 = Cell.new('B2')
    @cell_7 = Cell.new('B3')
    @cell_8 = Cell.new('B4')
    @cell_9 = Cell.new('C1')
    @cell_10 = Cell.new('C2')
    @cell_11 = Cell.new('C3')
    @cell_12 = Cell.new('C4')
    @cell_13 = Cell.new('D1')
    @cell_14 = Cell.new('D2')
    @cell_15 = Cell.new('D3')
    @cell_16 = Cell.new('D4')


    @cells = {
      "A1" => @cell_1,
      "A2" => @cell_2,
      "A3" => @cell_3,
      "A4" => @cell_4,
      "B1" => @cell_5,
      "B2" => @cell_6,
      "B3" => @cell_7,
      "B4" => @cell_8,
      "C1" => @cell_9,
      "C2" => @cell_10,
      "C3" => @cell_11,
      "C4" => @cell_12,
      "D1" => @cell_13,
      "D2" => @cell_14,
      "D3" => @cell_15,
      "D4" => @cell_16
    }

  end



  def valid_coordinate?(cell_coordinates)
    valid_coordinate = false
    @cells.keys.each do |cell|
      if cell == cell_coordinates
        valid_coordinate = true
      end
    end
    return valid_coordinate
  end



  def valid_placement?(ship_name, ship_cells)
    # example ship - cruiser, length = 3
    # example ship cells - A1, A2, A3

    # empty arrays to hold letters, numbers
    letters = []
    numbers = []

    ship_cells.each do |cell|
      coordinates = cell.split(//)
      letters << coordinates[0]
      numbers << coordinates[1]
    end
    # letters = AAA
    # numbers = 123

    equal_length = ship_name.length == ship_cells.length
    # boolean - ship_name = 3, ship_cells.length = 3, so true

    # establish booleans for following blocks - set to false by default
    valid_letters = false
    consecutive_numbers  = false

    #   AAA    ==   range, A to A, so AA     or    A min, A max, so A=A
    #               (this is false)                  (this is true, valid)
    if (letters == (letters.min..letters.max)) || letters.min == letters.max
      valid_letters = true
    end

    #   123     ==  range, 1 to 3, so 123      or    1 min, 3 max, but 1!= 3
    #               this is true                      this is false
    #                                returns true overall with 'or'
    if (numbers == (numbers.min..numbers.max)) || numbers.min == numbers.max
      valid_numbers = true
    end

    # need to ensure that A1, B2, C3 fails
    # only number or letter conditional can be met
    if (numbers.min != numbers.max && letters.min != letters.max)
      not_diagonal = false
    else
      not_diagonal = true
    end

    # if 4 booleans above are all true - return true
    if equal_length && valid_letters && valid_numbers && not_diagonal
      return true
    else
      return false
    end
  end


  def place(ship_name, ship_coordinates)

    if valid_placement(ship_name, ship_coordinates)
      ship_coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship_name)
      end
    else
      puts "Placement is not valid"
    end
  end


  def render
    print ("  1 2 3 4 ")
    print ("A " + @cells["A1"].cell_state + ' ' + @cells["A2"].cell_state + ' ' + @cells["A3"].cell_state + ' ' + @cells["A4"].cell_state)
    print ("B " + @cells["B1"].cell_state + ' ' + @cells["B2"].cell_state + ' ' + @cells["B3"].cell_state + ' ' + @cells["B4"].cell_state)
    print ("C " + @cells["C1"].cell_state + ' ' + @cells["C2"].cell_state + ' ' + @cells["C3"].cell_state + ' ' + @cells["C4"].cell_state)
    print ("D " + @cells["D1"].cell_state + ' ' + @cells["D2"].cell_state + ' ' + @cells["D3"].cell_state + ' ' + @cells["D4"].cell_state)
  end

end
