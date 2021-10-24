


class Computer

  attr_reader :possible_cruiser_positions, :possible_submarine_positions

  def initialize
    @possible_cruiser_positions = [
      # Rows to Vertical variations (two possible)
      ["A1", "A2", "A3"], # Horizontal, R1-V1
      ["A2", "A3", "A4"], # Horizontal, R1-V2

      ["B1", "B2", "B3"], # Horizontal, R2-V1
      ["B2", "B3", "B4"], # Horizontal, R2-V2

      ["C1", "C2", "C3"], # Horizontal, R3-V1
      ["C2", "C3", "C4"], # Horizontal, R3-V2

      ["D1", "D2", "D3"], # Horizontal, R4-V1
      ["D2", "D3", "D4"], # Horizontal, R4-V2

      ["A1", "B1", "C1"], # Vertical, C1-V1
      ["B1", "C1", "D1"], # Vertical, C1-V2

      ["A2", "B2", "C2"], # Vertical, C2-V1
      ["B2", "C2", "D2"], # Vertical, C2-V2

      ["A3", "B3", "C3"], # Vertical, C3-V1
      ["B3", "C3", "D3"], # Vertical, C3-V2

      ["A4", "B4", "C4"], # Vertical, C4-V1
      ["B4", "C4", "D4"] # Vertical, C4-V2
    ]

    @possible_submarine_positions = [
      # Rows to Vertical variations (three possible)
      ["A1", "A2"], # Horizontal, R1-V1
      ["A2", "A3"], # Horizontal, R1-V2
      ["A3", "A4"], # Horizontal, R1-V3

      ["B1", "B2"], # Horizontal, R2-V1
      ["B1", "B3"], # Horizontal, R2-V2
      ["B3", "B4"], # Horizontal, R2-V3

      ["C1", "C2"], # Horizontal, R3-V1
      ["C2", "C3"], # Horizontal, R3-V2
      ["C3", "C4"], # Horizontal, R3-V3

      ["D1", "D2"], # Horizontal, R4-V1
      ["D2", "D3"], # Horizontal, R4-V2
      ["D3", "D4"], # Horizontal, R4-V3

      ["A1", "B1"], # Vertical, C1-V1
      ["B1", "C1"], # Vertical, C1-V2
      ["C1", "D1"], # Vertical, C1-V3

      ["A2", "B2"], # Vertical, C2-V1
      ["B2", "C2"], # Vertical, C2-V2
      ["C2", "D2"], # Vertical, C2-V3

      ["A3", "B3"], # Vertical, C3-V1
      ["B3", "C3"], # Vertical, C3-V2
      ["C3", "D3"], # Vertical, C3-V3

      ["A4", "B4"], # Vertical, C4-V1
      ["B4", "C4"], # Vertical, C4-V2
      ["C4", "D4"] # Vertical, C4-V3
    ]
  end
  # require 'pry'; binding.pry
  def random_cruiser_position
    @possible_cruiser_positions.sample
  end

  def random_sub_position
    @possible_submarine_positions.sample
  end


end
