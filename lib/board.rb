
class Board
  attr_reader :layout, :header

  def initialize
    @layout = {} # move this into create_layout method
    @header = "ABCDEFG" 
    create_layout
    @diag_start_keys = [:A4, :A5, :A6, :B6, :C6, :D6]
    @diag_start_keys2 = [:G4, :G5, :G6, :F6, :E6, :D6]
    @diag_array = []
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

  def winner?
    return true if horizontal_win
    return true if vertical_win
    return true if diagonal_win
    false
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

  def diagonal_win
    @diag_start_keys.each do |key|
      generate_diagonal_array(key, "up")
    end
 
    @diag_start_keys2.each do |key|
      generate_diagonal_array(key, "down")
    end

    diag_array = @diag_array.join("")

    diag_array.include?("XXXX") || diag_array.include?("OOOO")
  end

  def generate_diagonal_array(start, direction)
    current_location = start
    until @layout[current_location].nil?
      @diag_array << @layout[current_location]
      current_location = start.to_s.split("")
      current_location[0] = combine(current_location[0], direction)
      current_location[1] = (current_location[1].to_i - 1).to_s
      next_location = current_location.join("").to_sym
        if @layout[next_location].nil?
          @diag_array << "NOPE"
          break
        end
      generate_diagonal_array(next_location, direction)
    end
    
  end

  def combine(loc, direction)
    if direction == "up"
      return (loc.ord + 1).chr
    elsif direction == "down"
      return (loc.ord - 1).chr 
    end
  end

end