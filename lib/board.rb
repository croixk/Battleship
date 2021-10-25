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



  def valid_coordinate?(cell_coordinates) # Takes single coordiante as argument
    valid_coordinate = false # Default return value
    @cells.keys.each do |cell| # Loop through all keys in hash
      # require "pry"; binding.pry
      if cell == cell_coordinates && (@cells[cell_coordinates].fired_upon? == false) # Checks to see if inputted coordinate exists within our hash
        valid_coordinate = true # If it does, return true
      end
    end
    return valid_coordinate
  end



  def valid_placement?(ship_name, ship_cells)
    # example ship - cruiser, length = 3
    # example ship cells - ["A1", "A2", A3]

    # empty arrays to hold letters, numbers
    letters = []
    numbers = []

    ship_cells.each do |cell|
      coordinates = cell.split(//)
      letters << coordinates[0]
      numbers << (coordinates[1].to_i)
    end
    # letters = AAA
    # numbers = 123

    equal_length = ship_name.length == ship_cells.length
    # boolean - ship_name = 3, ship_cells.length = 3, so true

    # establish booleans for following blocks - set to false by default
    valid_letters = false

    #   AAA    ==   range, A to A, so AA     or    A min, A max, so A=A
    #               (this is false)                  (this is true, valid)
    if letters == (letters.min..letters.max).to_a || letters.min == letters.max
      valid_letters = true
    end

    #   123     ==  range, 1 to 3, so 123      or    1 min, 3 max, but 1!= 3
    #               this is true                      this is false
    #                                returns true overall with 'or'
    valid_numbers = false
    if numbers == (numbers.min..numbers.max).to_a || numbers.min == numbers.max
      valid_numbers = true
    end

    # need to ensure that A1, B2, C3 fails
    # only number or letter conditional can be met
    if (numbers.min.to_i != numbers.max.to_i && letters.min != letters.max)
      not_diagonal = false
    else
      not_diagonal = true
    end

    is_valid_coordinate = true

    ship_cells.each do |cell|
      if valid_coordinate?(cell) == false
        is_valid_coordinate = false
      end
    end

    has_no_ship = true
    ship_cells.each do |cell| # Checks provided cell arrays to see if @current_ship attribute is nil
      # Compare respective element of inputted array to cell hash value equivalen
      if @cells[cell].ship != nil
        has_no_ship = false # if not nil, valid_placement? = false
      end
    end

    # require "pry"; binding.pry

    # if 6 booleans above are all true - return true
    if equal_length && valid_letters && valid_numbers && not_diagonal && is_valid_coordinate && has_no_ship
      return true
    else
      return false
    end
  end


  def place(ship_name, ship_coordinates)

    # Places instance of ship in respective cells provided (ship_coordinates)
    ship_coordinates.each do |coordinate|
      self.cells[coordinate].place_ship(ship_name)
    end

    # Legacy:
    # if valid_placement?(ship_name, ship_coordinates)
    #   ship_coordinates.each do |coordinate|
    #     self.cells[coordinate].place_ship(ship_name)
    #   end
    # else
    #   puts "Invalid placement."
    # end

  end


  def render(optional_bool = false)
    puts ("  1 2 3 4 ")
    puts ("A " + @cells["A1"].render(optional_bool) + ' ' + @cells["A2"].render(optional_bool) + ' ' + @cells["A3"].render(optional_bool) + ' ' + @cells["A4"].render(optional_bool))
    puts ("B " + @cells["B1"].render(optional_bool) + ' ' + @cells["B2"].render(optional_bool) + ' ' + @cells["B3"].render(optional_bool) + ' ' + @cells["B4"].render(optional_bool))
    puts ("C " + @cells["C1"].render(optional_bool) + ' ' + @cells["C2"].render(optional_bool) + ' ' + @cells["C3"].render(optional_bool) + ' ' + @cells["C4"].render(optional_bool))
    puts ("D " + @cells["D1"].render(optional_bool) + ' ' + @cells["D2"].render(optional_bool) + ' ' + @cells["D3"].render(optional_bool) + ' ' + @cells["D4"].render(optional_bool))
  end

end
