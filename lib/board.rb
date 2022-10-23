
class Board
  attr_reader :layout, :header, :diag_array

  def initialize
    @header = "ABCDEFG" 
    @numbers = [1, 2, 3, 4, 5, 6] 
    @r_numbers = [6, 5, 4, 3, 2, 1]
    @letters = ["A", "B", "C", "D", "E", "F", "G"]
    @diag_start_keys = [:A4, :A5, :A6, :B6, :C6, :D6]
    @diag_start_keys2 = [:G4, :G5, :G6, :F6, :E6, :D6]
    @diag_array = []
    
    create_layout
  end

  def random_column
    @header.split("").sample
  end

  def test_column(selection)
      @header.include?(selection) &&
      @layout["#{selection}#{'1'}".to_sym].include?(".")
  end

  def create_layout
    @layout = {} 
    @letters.each do |letter|
      @numbers.each do |number|
        @layout["#{letter}#{number}".to_sym] = "."
      end
    end
  end

  def winner?
    return true if horizontal_win || vertical_win || diagonal_win
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

  def check_for_four_in(line)
    string = line.join("")
    string.include?("XXXX") || string.include?("OOOO")
  end

  def horizontal_win 
    line = []
    @r_numbers.each do |number|
      @letters.each do |letter|
         line << @layout["#{letter}#{number}".to_sym] 
      end
      return true if check_for_four_in(line) 
      line.clear
    end
    false
  end

  def vertical_win 
    line = []
    @letters.each do |letter|
      @r_numbers.each do |number|
         line << @layout["#{letter}#{number}".to_sym]
      end
      return true if check_for_four_in(line) 
      line.clear
    end
    false
  end

  def diagonal_win
    @diag_start_keys.each do |key|
      generate_diag_array(key, "up")
    end
 
    @diag_start_keys2.each do |key|
      generate_diag_array(key, "down")
    end

    check_for_four_in(@diag_array)
  end

  # helper method for generate_diagonal_array
  def increment(letter, direction)
    if direction == "up"
      (letter.ord + 1).chr
    elsif direction == "down"
      (letter.ord - 1).chr 
    end
  end

  def generate_diag_array(start, direction)
    node = start
    until @layout[node].nil?
      @diag_array << @layout[node]
      node = start.to_s.split("")
      node[0] = increment(node[0], direction)
      node[1] = (node[1].to_i - 1).to_s
      next_node = node.join("").to_sym
        if @layout[next_node].nil?
          @diag_array << "NOPE"
          break
        end
      generate_diag_array(next_node, direction)
    end
  end
end