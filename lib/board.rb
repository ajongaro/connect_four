require './lib/space'

class Board
  attr_reader :layout

  HEADER = "ABCDEFG"

  def initialize
    @layout = {}
    create_layout
  end

  # build the board into @layout
  def create_layout
    ("A".."G").to_a.each do |letter|
      (1..6).each do |number|
        @layout["#{letter}#{number}".to_sym] = Space.new
      end
    end
  end

  # an array of strings to iterate through for "xxxx" or "oooo"
  def possible_wins
    [
    row_1,
    row_2,
    row_3,
    row_4,
    row_5,
    row_6,
    column_A,
    column_B,
    column_C,
    column_D,
    column_E,
    column_F,
    column_G,
    diag_1,
    diag_2,
    diag_3,
    diag_4,
    diag_5,
    diag_6,
    diag_7,
    diag_8,
    diag_9,
    diag_10,
    diag_11,
    diag_12
  ]
  end

  def winner?
    possible_wins.each do |line|
      return true if line.include?("XXXX") || line.include?("OOOO")
    end
    false # if no connect 4's are found
  end

  def tie?
    return false if winner?
    if @layout.values.select { |value| value.available == true} == []
      return true
    end
  end

  # return formatted board for printing to terminal
  def display_board 
    "#{HEADER}\n#{row_1}\n#{row_2}\n#{row_3}\n#{row_4}\n#{row_5}\n#{row_6}"
  end

  # do we want to store these as instance variables instead of methods?
  def row_1
    "#{@layout[:A1].slot}#{@layout[:B1].slot}#{@layout[:C1].slot}#{@layout[:D1].slot}#{@layout[:E1].slot}#{@layout[:F1].slot}#{@layout[:G1].slot}"
  end

  def row_2
    "#{@layout[:A2].slot}#{@layout[:B2].slot}#{@layout[:C2].slot}#{@layout[:D2].slot}#{@layout[:E2].slot}#{@layout[:F2].slot}#{@layout[:G2].slot}"
  end

  def row_3
    "#{@layout[:A3].slot}#{@layout[:B3].slot}#{@layout[:C3].slot}#{@layout[:D3].slot}#{@layout[:E3].slot}#{@layout[:F3].slot}#{@layout[:G3].slot}"
  end

  def row_4
    "#{@layout[:A4].slot}#{@layout[:B4].slot}#{@layout[:C4].slot}#{@layout[:D4].slot}#{@layout[:E4].slot}#{@layout[:F4].slot}#{@layout[:G4].slot}"
  end

  def row_5
    "#{@layout[:A5].slot}#{@layout[:B5].slot}#{@layout[:C5].slot}#{@layout[:D5].slot}#{@layout[:E5].slot}#{@layout[:F5].slot}#{@layout[:G5].slot}"
  end

  def row_6
    "#{@layout[:A6].slot}#{@layout[:B6].slot}#{@layout[:C6].slot}#{@layout[:D6].slot}#{@layout[:E6].slot}#{@layout[:F6].slot}#{@layout[:G6].slot}"
  end

  def column_A
    "#{@layout[:A1].slot}#{@layout[:A2].slot}#{@layout[:A3].slot}#{@layout[:A4].slot}#{@layout[:A5].slot}#{@layout[:A6].slot}"
  end

  def column_B
    "#{@layout[:B1].slot}#{@layout[:B2].slot}#{@layout[:B3].slot}#{@layout[:B4].slot}#{@layout[:B5].slot}#{@layout[:B6].slot}"
  end

  def column_C
    "#{@layout[:C1].slot}#{@layout[:C2].slot}#{@layout[:C3].slot}#{@layout[:C4].slot}#{@layout[:C5].slot}#{@layout[:C6].slot}"
  end

  def column_D
    "#{@layout[:D1].slot}#{@layout[:D2].slot}#{@layout[:D3].slot}#{@layout[:D4].slot}#{@layout[:D5].slot}#{@layout[:D6].slot}"
  end

  def column_E
    "#{@layout[:E1].slot}#{@layout[:E2].slot}#{@layout[:E3].slot}#{@layout[:E4].slot}#{@layout[:E5].slot}#{@layout[:E6].slot}"
  end

  def column_F
    "#{@layout[:F1].slot}#{@layout[:F2].slot}#{@layout[:F3].slot}#{@layout[:F4].slot}#{@layout[:F5].slot}#{@layout[:F6].slot}"
  end

  def column_G
    "#{@layout[:G1].slot}#{@layout[:G2].slot}#{@layout[:G3].slot}#{@layout[:G4].slot}#{@layout[:G5].slot}#{@layout[:G6].slot}"
  end

  def diag_1
    "#{@layout[:A4].slot}#{@layout[:B3].slot}#{@layout[:C2].slot}#{@layout[:D1].slot}"
  end

  def diag_2
    "#{@layout[:A5].slot}#{@layout[:B4].slot}#{@layout[:C3].slot}#{@layout[:D2].slot}#{@layout[:E1].slot}"
  end

  def diag_3
    "#{@layout[:A6].slot}#{@layout[:B5].slot}#{@layout[:C4].slot}#{@layout[:D3].slot}#{@layout[:E2].slot}#{@layout[:F1].slot}"
  end

  def diag_4
    "#{@layout[:B6].slot}#{@layout[:C5].slot}#{@layout[:D4].slot}#{@layout[:E3].slot}#{@layout[:F2].slot}#{@layout[:G1].slot}"
  end

  def diag_5
    "#{@layout[:C6].slot}#{@layout[:D5].slot}#{@layout[:E4].slot}#{@layout[:F3].slot}#{@layout[:G2].slot}"
  end

  def diag_6
    "#{@layout[:D6].slot}#{@layout[:E5].slot}#{@layout[:F4].slot}#{@layout[:G3].slot}"
  end

  def diag_7
    "#{@layout[:G4].slot}#{@layout[:F3].slot}#{@layout[:E2].slot}#{@layout[:D1].slot}"
  end

  def diag_8
    "#{@layout[:G5].slot}#{@layout[:F4].slot}#{@layout[:E3].slot}#{@layout[:D2].slot}#{@layout[:C1].slot}"
  end

  def diag_9
    "#{@layout[:G6].slot}#{@layout[:F5].slot}#{@layout[:E4].slot}#{@layout[:D3].slot}#{@layout[:C2].slot}#{@layout[:B1].slot}"
  end

  def diag_10
    "#{@layout[:F6].slot}#{@layout[:E5].slot}#{@layout[:D4].slot}#{@layout[:C3].slot}#{@layout[:B2].slot}#{@layout[:A1].slot}"
  end

  def diag_11
    "#{@layout[:E6].slot}#{@layout[:D5].slot}#{@layout[:C4].slot}#{@layout[:B3].slot}#{@layout[:A2].slot}"
  end

  def diag_12
    "#{@layout[:D6].slot}#{@layout[:C5].slot}#{@layout[:B4].slot}#{@layout[:A3].slot}"
  end

end
