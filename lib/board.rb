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


  # doesn't seem to be failing E - why?
  # also needs to fail A22 - currently just pulls 2, not 22, doesn't fail
  def valid_coordinate?(cell_coordinates)
    cell_coordinates = cell_coordinates.split(//)
    letter = cell_coordinates[0]
    number = cell_coordinates[1].to_i

    # require "pry"; binding.pry

    # complete this
    if ("A".."D").include?(letter) && (1 <= number) && (4 >= number)
      return true
    else
      return false
    end
  end



  # def valid_placement?(ship_name, ship_cells)
  #   # number of coordinates
  #   letters = []
  #   numbers = []
  #
  #   ship_cells.each do |cell|
  #     coordinates = cell.split(//)
  #     letters << cell_coordinates[0]
  #     numbers << cell_coordinates[1]
  #   end
  #
  #   letters_consecutive = letters.sort
  #   numbers_consecutive = numbers.sort
  #
  #   if ship_length != ship_cell.length
  #     return false
  #   # consecutive coordinates
  # elsif letters != letters_consecutive || numbers != numbers_consecutive
  #     return false
  #   # diagonal check - do something along the lines of last element minus first
  #     # element of one can't equal that of the other (one has to be 0)
  #   elsif #### ADD CODE HERE
  #     return false
  #   else
  #     return true
  #   end
  # end

  def place(ship_name, ship_coordinates)
    # modify each cell specified to contain ship ship_name
    ship_coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship_name)
    end
  end


  def render
    print ("  1 2 3 4 ")
    print ("A " + @cells["A1"].cell_state + ' ' + @cells["A2"].cell_state + ' ' + @cells["A3"].cell_state + ' ' + @cells["A4"].cell_state)
    print ("B " + @cells["B1"].cell_state + ' ' + @cells["B2"].cell_state + ' ' + @cells["B3"].cell_state + ' ' + @cells["B4"].cell_state)
    print ("C " + @cells["C1"].cell_state + ' ' + @cells["C2"].cell_state + ' ' + @cells["C3"].cell_state + ' ' + @cells["C4"].cell_state)
    print ("D " + @cells["C1"].cell_state + ' ' + @cells["D2"].cell_state + ' ' + @cells["D3"].cell_state + ' ' + @cells["D4"].cell_state)

  end

end
