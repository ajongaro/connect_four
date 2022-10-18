require './lib/space'

class Board
  attr_reader :layout

  HEADER = "ABCDEFG"

  def initialize
    @layout = {}
    create_layout
  end

  def create_layout
    ("A".."G").to_a.each do |letter|
      (1..6).each do |number|
        @layout["#{letter}#{number}".to_sym] = Space.new
      end
    end
  end

  def display_board 
    "#{HEADER}\n#{row_1}\n#{row_2}\n#{row_3}\n#{@layout[:A4].slot}#{@layout[:B4].slot}#{@layout[:C4].slot}#{@layout[:D4].slot}#{@layout[:E4].slot}#{@layout[:F4].slot}#{@layout[:G4].slot}\n#{@layout[:A5].slot}#{@layout[:B5].slot}#{@layout[:C5].slot}#{@layout[:D5].slot}#{@layout[:E5].slot}#{@layout[:F5].slot}#{@layout[:G5].slot}\n#{@layout[:A6].slot}#{@layout[:B6].slot}#{@layout[:C6].slot}#{@layout[:D6].slot}#{@layout[:E6].slot}#{@layout[:F6].slot}#{@layout[:G6].slot}"
  end

  def row_1
    "#{@layout[:A1].slot}#{@layout[:B1].slot}#{@layout[:C1].slot}#{@layout[:D1].slot}#{@layout[:E1].slot}#{@layout[:F1].slot}#{@layout[:G1].slot}"
  end

  def row_2
    "#{@layout[:A2].slot}#{@layout[:B2].slot}#{@layout[:C2].slot}#{@layout[:D2].slot}#{@layout[:E2].slot}#{@layout[:F2].slot}#{@layout[:G2].slot}"
  end

  def row_3
    "#{@layout[:A3].slot}#{@layout[:B3].slot}#{@layout[:C3].slot}#{@layout[:D3].slot}#{@layout[:E3].slot}#{@layout[:F3].slot}#{@layout[:G3].slot}"
  end
end

