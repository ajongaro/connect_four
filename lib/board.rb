
class Board
  attr_reader :layout, :header

  def initialize
    @layout = {} # move this into create_layout method
    @header = "ABCDEFG" 
    create_layout
  end

  def random_column
    @header.split("").sample
  end

  # needs test - checks to see if col valid and top spot in col is avail
  def test_column(selection)
      @header.include?(selection) &&
      @layout["#{selection}#{'1'}".to_sym].include?(".")
  end

  # build the board into @layout
  def create_layout
    @layout = {} # move this into create_layout method
    ("A".."G").to_a.each do |letter|
      (1..6).each do |number|
        @layout["#{letter}#{number}".to_sym] = "."
      end
    end
  end

  # an array of strings to iterate through for "xxxx" or "oooo"
  def diag_wins
    [ diag_1, diag_2, diag_3, diag_4, diag_5, diag_6, diag_7,
    diag_8, diag_9, diag_10, diag_11, diag_12 ]
  end

  def diag_win # should this be calculated from the board class or turn?
    diag_wins.each do |line|
      return true if line.include?("XXXX") || line.include?("OOOO")
    end
    false # if no connect 4's are found
  end

  def tie?
    return false if winner?
    if @layout.values.select { |value| value.include?(".") } == []
      return true
    end
  end

  # return formatted board for printing to terminal
  def pretty_print
    array = ["ABCDEFG\n"]
    (1..6).to_a.each do |number|
      ("A".."G").each do |letter|
         array << @layout["#{letter}#{number}".to_sym]
      end
      array << "\n"
    end
    array.join("")
  end

  def winner?
    return true if horizontal_win
    return true if vertical_win
    return true if diag_win
    false
  end

  def horizontal_win 
    array = []
    6.downto(1).to_a.each do |number|
      ("A".."G").each do |letter|
         array << @layout["#{letter}#{number}".to_sym] 
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
         array << @layout["#{letter}#{number}".to_sym]
      end
      return true if array.join("").include?("XXXX") || array.join("").include?("OOOO") 
      array.clear
    end
    false
  end

  def diag_1
    "#{@layout[:A4]}#{@layout[:B3]}#{@layout[:C2]}#{@layout[:D1]}"
  end

  def diag_2
    "#{@layout[:A5]}#{@layout[:B4]}#{@layout[:C3]}#{@layout[:D2]}#{@layout[:E1]}"
  end

  def diag_3
    "#{@layout[:A6]}#{@layout[:B5]}#{@layout[:C4]}#{@layout[:D3]}#{@layout[:E2]}#{@layout[:F1]}"
  end

  def diag_4
    "#{@layout[:B6]}#{@layout[:C5]}#{@layout[:D4]}#{@layout[:E3]}#{@layout[:F2]}#{@layout[:G1]}"
  end

  def diag_5
    "#{@layout[:C6]}#{@layout[:D5]}#{@layout[:E4]}#{@layout[:F3]}#{@layout[:G2]}"
  end

  def diag_6
    "#{@layout[:D6]}#{@layout[:E5]}#{@layout[:F4]}#{@layout[:G3]}"
  end

  def diag_7
    "#{@layout[:G4]}#{@layout[:F3]}#{@layout[:E2]}#{@layout[:D1]}"
  end

  def diag_8
    "#{@layout[:G5]}#{@layout[:F4]}#{@layout[:E3]}#{@layout[:D2]}#{@layout[:C1]}"
  end

  def diag_9
    "#{@layout[:G6]}#{@layout[:F5]}#{@layout[:E4]}#{@layout[:D3]}#{@layout[:C2]}#{@layout[:B1]}"
  end

  def diag_10
    "#{@layout[:F6]}#{@layout[:E5]}#{@layout[:D4]}#{@layout[:C3]}#{@layout[:B2]}#{@layout[:A1]}"
  end

  def diag_11
    "#{@layout[:E6]}#{@layout[:D5]}#{@layout[:C4]}#{@layout[:B3]}#{@layout[:A2]}"
  end

  def diag_12
    "#{@layout[:D6]}#{@layout[:C5]}#{@layout[:B4]}#{@layout[:A3]}"
  end
end
