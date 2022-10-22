require './lib/space'

class Board
  attr_reader :layout, :header

  def initialize
    @layout = {} # move this into create_layout method
    @header = "ABCDEFG" 
    create_layout
  end

  # needs test
  def test_column(selection)
    @header.include?(selection)
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
  def diag_wins
    [ diag_1, diag_2, diag_3, diag_4, diag_5, diag_6, diag_7,
    diag_8, diag_9, diag_10, diag_11, diag_12 ]
  end

  def diag_win
    diag_wins.each do |line|
      return true if line.include?("XXXX") || line.include?("OOOO")
    end
    false # if no connect 4's are found
  end

  def tie?
    return false if search_for_winner
    if @layout.values.select { |value| value.available == true} == []
      return true
    end
  end

  # return formatted board for printing to terminal
  def pretty_print
    array = ["ABCDEFG\n"]
    (1..6).to_a.each do |number|
      ("A".."G").each do |letter|
         array << @layout["#{letter}#{number}".to_sym].slot 
      end
      array << "\n"
    end
    array.join("")
  end

  def search_for_winner
    return true if horizontal_win
    return true if vertical_win
    return true if diag_win
    false
  end

  def horizontal_win 
    array = []
    6.downto(1).to_a.each do |number|
      ("A".."G").each do |letter|
         array << @layout["#{letter}#{number}".to_sym].slot 
      end
      return true if array.join("").include?("XXXX") || array.join("").include?("OOOO") 
      array.clear
    end
    false
  end

  def vertical_win 
    array = []
    ("A".."G").each do |letter|
      6.downto(1).to_a.each do |number|
         array << @layout["#{letter}#{number}".to_sym].slot 
      end
      return true if array.join("").include?("XXXX") || array.join("").include?("OOOO") 
      array.clear
    end
    false
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
